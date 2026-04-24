#!/usr/bin/env python3
"""
Value Stream Mapper

Visualizes the deployment flow from code commit to production and
identifies waste (wait times, manual steps, rework loops). This tool
helps platform teams see where the delivery pipeline loses time and
where automation can have the biggest impact.

The mapper models a deployment pipeline as a sequence of stages, each
with a process time (hands-on work) and a lead time (wall-clock time
including waits). The ratio between these reveals queuing waste.

Key Metrics:
- Process Efficiency: total process time / total lead time
- Bottleneck Stage: the stage with the worst process/lead ratio
- Automation Opportunity: manual stages with highest lead times

Usage:
    python value-stream-mapper.py                    # Run with example pipeline
    python value-stream-mapper.py --interactive      # Define your own stages
    python value-stream-mapper.py --export results   # Export to JSON
"""

import json
import sys
import argparse
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, field, asdict


@dataclass
class PipelineStage:
    """A single stage in the deployment value stream."""
    name: str
    process_time_minutes: float   # Actual hands-on work time
    lead_time_minutes: float      # Wall-clock time (includes waits/queues)
    is_manual: bool = False       # Whether this step requires human action
    is_automated: bool = True     # Whether this step is automated
    rework_rate: float = 0.0      # Percentage of times this stage causes rework (0-1)
    description: str = ""

    @property
    def efficiency(self) -> float:
        """Process efficiency: ratio of work time to total time."""
        if self.lead_time_minutes == 0:
            return 1.0
        return self.process_time_minutes / self.lead_time_minutes

    @property
    def wait_time_minutes(self) -> float:
        """Time spent waiting (not working)."""
        return self.lead_time_minutes - self.process_time_minutes


@dataclass
class ValueStreamMap:
    """Complete value stream map for a deployment pipeline."""
    name: str
    stages: List[PipelineStage] = field(default_factory=list)

    @property
    def total_process_time(self) -> float:
        return sum(s.process_time_minutes for s in self.stages)

    @property
    def total_lead_time(self) -> float:
        return sum(s.lead_time_minutes for s in self.stages)

    @property
    def total_wait_time(self) -> float:
        return self.total_lead_time - self.total_process_time

    @property
    def process_efficiency(self) -> float:
        if self.total_lead_time == 0:
            return 1.0
        return self.total_process_time / self.total_lead_time

    @property
    def bottleneck(self) -> Optional[PipelineStage]:
        if not self.stages:
            return None
        return min(self.stages, key=lambda s: s.efficiency)

    @property
    def manual_stages(self) -> List[PipelineStage]:
        return [s for s in self.stages if s.is_manual]

    @property
    def automation_opportunities(self) -> List[PipelineStage]:
        """Manual stages sorted by lead time (biggest opportunities first)."""
        return sorted(self.manual_stages, key=lambda s: s.lead_time_minutes, reverse=True)


def create_example_pipeline() -> ValueStreamMap:
    """Create an example deployment pipeline for demonstration."""
    vsm = ValueStreamMap(name="Typical Deployment Pipeline")
    vsm.stages = [
        PipelineStage(
            name="Code Commit & PR",
            process_time_minutes=30,
            lead_time_minutes=30,
            is_manual=False,
            is_automated=True,
            description="Developer pushes code and creates pull request",
        ),
        PipelineStage(
            name="Code Review",
            process_time_minutes=20,
            lead_time_minutes=240,
            is_manual=True,
            is_automated=False,
            rework_rate=0.3,
            description="Peer review — often blocked waiting for reviewer availability",
        ),
        PipelineStage(
            name="CI Build & Test",
            process_time_minutes=15,
            lead_time_minutes=20,
            is_manual=False,
            is_automated=True,
            rework_rate=0.1,
            description="Automated build, unit tests, integration tests",
        ),
        PipelineStage(
            name="Security Scan",
            process_time_minutes=10,
            lead_time_minutes=10,
            is_manual=False,
            is_automated=True,
            description="Container image scanning, SAST, dependency audit",
        ),
        PipelineStage(
            name="Staging Deploy",
            process_time_minutes=5,
            lead_time_minutes=15,
            is_manual=False,
            is_automated=True,
            description="Automated deployment to staging environment",
        ),
        PipelineStage(
            name="QA Validation",
            process_time_minutes=60,
            lead_time_minutes=480,
            is_manual=True,
            is_automated=False,
            rework_rate=0.2,
            description="Manual QA testing — often queued behind other releases",
        ),
        PipelineStage(
            name="Change Approval",
            process_time_minutes=5,
            lead_time_minutes=120,
            is_manual=True,
            is_automated=False,
            description="CAB or manager approval — calendar-dependent delay",
        ),
        PipelineStage(
            name="Production Deploy",
            process_time_minutes=10,
            lead_time_minutes=30,
            is_manual=False,
            is_automated=True,
            description="Canary or blue-green deployment to production",
        ),
        PipelineStage(
            name="Post-Deploy Verify",
            process_time_minutes=15,
            lead_time_minutes=15,
            is_manual=False,
            is_automated=True,
            description="Smoke tests, SLO checks, rollback readiness",
        ),
    ]
    return vsm


def ask_stages_interactively() -> ValueStreamMap:
    """Build a value stream map from interactive user input."""
    print("\n" + "=" * 70)
    print("VALUE STREAM MAPPER — Interactive Mode")
    print("=" * 70)
    print("\nDefine each stage of your deployment pipeline.")
    print("Enter an empty name to finish.\n")

    name = input("Pipeline name [My Deployment Pipeline]: ").strip()
    if not name:
        name = "My Deployment Pipeline"

    vsm = ValueStreamMap(name=name)

    stage_num = 1
    while True:
        print(f"\n--- Stage {stage_num} ---")
        stage_name = input("Stage name (empty to finish): ").strip()
        if not stage_name:
            break

        while True:
            try:
                process_time = float(input("  Process time (minutes of actual work): "))
                lead_time = float(input("  Lead time (total wall-clock minutes): "))
                if lead_time < process_time:
                    print("  Lead time must be >= process time. Try again.")
                    continue
                break
            except ValueError:
                print("  Please enter valid numbers.")

        is_manual = input("  Is this a manual step? (y/n) [n]: ").strip().lower() == "y"

        rework = 0.0
        rework_input = input("  Rework rate (0-100%, how often does this cause redo?) [0]: ").strip()
        if rework_input:
            try:
                rework = float(rework_input) / 100.0
            except ValueError:
                pass

        vsm.stages.append(PipelineStage(
            name=stage_name,
            process_time_minutes=process_time,
            lead_time_minutes=lead_time,
            is_manual=is_manual,
            is_automated=not is_manual,
            rework_rate=rework,
        ))
        stage_num += 1

    return vsm


def format_time(minutes: float) -> str:
    """Format minutes into a human-readable string."""
    if minutes < 60:
        return f"{minutes:.0f}m"
    hours = minutes / 60
    if hours < 24:
        return f"{hours:.1f}h"
    days = hours / 24
    return f"{days:.1f}d"


def generate_report(vsm: ValueStreamMap) -> str:
    """Generate a visual value stream map report."""
    if not vsm.stages:
        return "No stages defined."

    report = "\n" + "=" * 70 + "\n"
    report += f"VALUE STREAM MAP: {vsm.name}\n"
    report += "=" * 70 + "\n\n"

    # Summary metrics
    report += "SUMMARY METRICS\n"
    report += "-" * 40 + "\n"
    report += f"  Total Process Time:  {format_time(vsm.total_process_time)}\n"
    report += f"  Total Lead Time:     {format_time(vsm.total_lead_time)}\n"
    report += f"  Total Wait Time:     {format_time(vsm.total_wait_time)}\n"
    report += f"  Process Efficiency:  {vsm.process_efficiency:.1%}\n"
    report += f"  Manual Stages:       {len(vsm.manual_stages)} of {len(vsm.stages)}\n"
    report += "\n"

    # Visual pipeline
    report += "DEPLOYMENT FLOW\n"
    report += "-" * 70 + "\n\n"

    max_name_len = max(len(s.name) for s in vsm.stages)
    max_lead = max(s.lead_time_minutes for s in vsm.stages)

    for i, stage in enumerate(vsm.stages):
        # Stage header
        tag = "[MANUAL]" if stage.is_manual else "[AUTO]  "
        report += f"  {tag} {stage.name:<{max_name_len}}"

        # Process bar vs wait bar
        bar_width = 30
        process_chars = max(1, int(stage.process_time_minutes / max_lead * bar_width))
        wait_chars = max(0, int(stage.wait_time_minutes / max_lead * bar_width))
        report += f"  [{('█' * process_chars)}{'░' * wait_chars}{'·' * (bar_width - process_chars - wait_chars)}]"
        report += f"  {format_time(stage.process_time_minutes)} / {format_time(stage.lead_time_minutes)}"
        eff = stage.efficiency
        if eff < 0.25:
            report += "  ⚠ WASTE"
        report += "\n"

        # Arrow between stages
        if i < len(vsm.stages) - 1:
            report += f"  {'':>{max_name_len + 10}}↓\n"

    report += "\n  Legend: █ = process time  ░ = wait time  · = scale padding\n"
    report += f"  Times shown as: process / lead\n"

    # Bottleneck analysis
    report += "\n" + "-" * 70 + "\n"
    report += "BOTTLENECK ANALYSIS\n"
    report += "-" * 70 + "\n\n"

    bottleneck = vsm.bottleneck
    if bottleneck:
        report += f"  Biggest bottleneck: {bottleneck.name}\n"
        report += f"    Process time:  {format_time(bottleneck.process_time_minutes)}\n"
        report += f"    Lead time:     {format_time(bottleneck.lead_time_minutes)}\n"
        report += f"    Wait time:     {format_time(bottleneck.wait_time_minutes)}\n"
        report += f"    Efficiency:    {bottleneck.efficiency:.1%}\n"
        report += f"    → {100 - bottleneck.efficiency * 100:.0f}% of this stage's time is spent waiting\n"

    # Automation opportunities
    opportunities = vsm.automation_opportunities
    if opportunities:
        report += "\n  Automation Opportunities (manual stages by lead time):\n"
        for i, stage in enumerate(opportunities, 1):
            report += f"    {i}. {stage.name}: {format_time(stage.lead_time_minutes)} lead time"
            report += f" (only {format_time(stage.process_time_minutes)} of actual work)\n"

    # Rework impact
    rework_stages = [s for s in vsm.stages if s.rework_rate > 0]
    if rework_stages:
        report += "\n  Rework Hotspots:\n"
        for stage in sorted(rework_stages, key=lambda s: s.rework_rate, reverse=True):
            report += f"    • {stage.name}: {stage.rework_rate:.0%} rework rate\n"

    # Recommendations
    report += "\n" + "-" * 70 + "\n"
    report += "RECOMMENDATIONS\n"
    report += "-" * 70 + "\n\n"

    if vsm.process_efficiency < 0.15:
        report += "  1. CRITICAL: Process efficiency is below 15%. Your pipeline spends\n"
        report += "     most of its time waiting, not working. Focus on eliminating\n"
        report += "     queuing delays and manual approval gates.\n\n"
    elif vsm.process_efficiency < 0.30:
        report += "  1. Process efficiency is below 30%. Significant room for improvement\n"
        report += "     by reducing wait times between stages.\n\n"

    if opportunities:
        top = opportunities[0]
        report += f"  2. Automate '{top.name}' first — it has the highest lead time\n"
        report += f"     ({format_time(top.lead_time_minutes)}) among manual stages.\n\n"

    if rework_stages:
        top_rework = max(rework_stages, key=lambda s: s.rework_rate)
        report += f"  3. Reduce rework at '{top_rework.name}' ({top_rework.rework_rate:.0%} rate).\n"
        report += f"     Shift-left with earlier feedback loops and automated checks.\n\n"

    report += "  Next Steps:\n"
    report += "  • Map your actual pipeline stages using --interactive mode\n"
    report += "  • Compare before/after when introducing platform capabilities\n"
    report += "  • Track process efficiency as a leading indicator of platform impact\n"
    report += "  • Use this alongside the Platform Maturity Assessment for a complete picture\n"

    report += "\n" + "=" * 70 + "\n"
    return report


def export_results(vsm: ValueStreamMap, filename: str) -> None:
    """Export value stream map to JSON."""
    data = {
        "pipeline_name": vsm.name,
        "summary": {
            "total_process_time_minutes": vsm.total_process_time,
            "total_lead_time_minutes": vsm.total_lead_time,
            "total_wait_time_minutes": vsm.total_wait_time,
            "process_efficiency": round(vsm.process_efficiency, 4),
            "num_stages": len(vsm.stages),
            "num_manual_stages": len(vsm.manual_stages),
        },
        "stages": [
            {
                "name": s.name,
                "process_time_minutes": s.process_time_minutes,
                "lead_time_minutes": s.lead_time_minutes,
                "wait_time_minutes": s.wait_time_minutes,
                "efficiency": round(s.efficiency, 4),
                "is_manual": s.is_manual,
                "rework_rate": s.rework_rate,
                "description": s.description,
            }
            for s in vsm.stages
        ],
    }

    output = filename if filename.endswith(".json") else f"{filename}.json"
    with open(output, "w") as f:
        json.dump(data, f, indent=2)
    print(f"\nResults exported to {output}")


def main():
    parser = argparse.ArgumentParser(
        description="Value Stream Mapper — visualize deployment flow and identify waste"
    )
    parser.add_argument(
        "--interactive", action="store_true",
        help="Define pipeline stages interactively"
    )
    parser.add_argument(
        "--export", type=str, default=None,
        help="Export results to JSON file (e.g., --export vsm_results)"
    )
    args = parser.parse_args()

    if args.interactive:
        vsm = ask_stages_interactively()
    else:
        print("\nUsing example deployment pipeline. Use --interactive for your own.")
        vsm = create_example_pipeline()

    if not vsm.stages:
        print("No stages defined. Exiting.")
        return

    report = generate_report(vsm)
    print(report)

    if args.export:
        export_results(vsm, args.export)


if __name__ == "__main__":
    main()
