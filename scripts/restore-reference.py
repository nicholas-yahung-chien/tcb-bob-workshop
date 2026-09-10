"""Explicit fallback: copy selected instructor answers into a new output directory."""
import argparse
from pathlib import Path
import shutil

root=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser()
parser.add_argument("target",choices=["plan","docs","unit","logs","sast","all"])
args=parser.parse_args()
groups={"plan":["architecture.md","checklist.md"],"docs":["program.md","impact-analysis.md","facts.json"],
        "unit":["normalizer.py","test_authored.py","test-report.md"],"logs":["log-analysis.md","log-facts.json"],
        "sast":["customer_lookup.py","sast-remediation.md"]}
files=sum(groups.values(),[]) if args.target=="all" else groups[args.target]
dest=root/"output"
if any((dest/f).exists() for f in files): raise SystemExit("Output exists. Use a fresh clone to preserve your work.")
dest.mkdir(exist_ok=True)
for name in files: shutil.copyfile(root/"reference"/name,dest/name)
print("Instructor fallback restored; these are reference answers, not new Bob-generated results.")
