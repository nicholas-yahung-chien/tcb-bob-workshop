"""Offline, standard-library acceptance checks. Never edits student output."""
import argparse
import hashlib
import json
import re
from pathlib import Path
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]


def require(condition, message):
    if not condition: raise AssertionError(message)


def document(name, min_chars=150):
    path = ROOT / "output" / name
    require(path.is_file(), f"Missing output/{name}")
    value = path.read_text(encoding="utf-8-sig")
    require(len(value.strip()) >= min_chars, f"Document too short: {name}")
    require(not any(ord(c) < 32 and c not in '\n\r\t' for c in value), f"Control characters in {name}; use a literal file-writing tool")
    return value


def plan():
    raw = document("architecture.md")
    architecture = raw.lower()
    document("checklist.md")
    for domain in ("cobol", "java", "database", "transaction", "api", "batch", "test"):
        require(domain in architecture, f"architecture.md must address {domain}")
    blocks = re.findall(r"```json\s*(.*?)```",raw,re.S)
    require(len(blocks) == 1, "architecture.md needs one source-check JSON block")
    facts = json.loads(blocks[0])
    expected = {"id_group_bytes":11,"id_field_bytes":10,"marker_field":"R-NAME",
                "rewrite_scope":"all-read-records","mainframe_encoding_confirmed":False,
                "repeat_input":"0000123456","repeat_once":"00123456  ","repeat_twice":"123456    "}
    require(facts == expected, "architecture source-check incorrect; inspect layout, scope, and repeat example")
    print("PASS: plan structure and source-check facts. Human rubric review is still required.")


def docs():
    document("program.md"); document("impact-analysis.md")
    data = json.loads(document("facts.json", 2))
    expected = {"record_bytes":400,"id_bytes":10,"suffix_position":11,"marker_start":14,
                "marker_length":3,"padding_positions":[9,10],"has_file_io":True,
                "redefines_extra_bytes":0,"synthetic":False,
                "repeat_input":"0000123456","repeat_once":"00123456  ","repeat_twice":"123456    "}
    for key, value in expected.items():
        require(type(data.get(key)) is type(value) and data[key] == value, f"facts.json: incorrect {key}")
    evidence = data.get("evidence", [])
    require(len(evidence) >= 3, "Need at least three source evidence entries")
    distinct = set()
    for item in evidence:
        require(item.get("file") in ("z-lab/CKP02.cbl", "bank-source/reading/CKP02.TXT"), "Evidence must cite CKP02 source")
        number = item.get("line")
        require(type(number) is int, "Evidence line must be an integer")
        lines = (ROOT / item["file"]).read_text(encoding="utf-8").splitlines()
        require(1 <= number <= len(lines), "Evidence line out of range")
        quote = item.get("quote", "")
        require(len(quote.strip()) >= 5 and quote in lines[number-1], f"Evidence quote mismatch at line {number}")
        distinct.add(number)
    require(len(distinct) >= 3, "Evidence must use distinct lines")
    print("PASS: CKP02 facts and exact source quotations. Semantic citation support requires human review.")


def logs():
    document("log-analysis.md")
    data = json.loads(document("log-facts.json", 2))
    expected = {"synthetic":True,"completed_normal":["DEMO-A"],"completed_failed":["DEMO-B"],
                "incomplete":["DEMO-C"],"slow_event_ids":["E08"],"root_cause_confirmed":False}
    require(data == expected, "Log classification differs from supplied events; review schema")
    print("PASS: synthetic log facts; no real IMS log was parsed.")


def run_tests(pattern, directory="tests"):
    result = subprocess.run([sys.executable,"-m","unittest","discover","-s",directory,"-p",pattern,"-v"], cwd=ROOT)
    require(result.returncode == 0, f"Tests failed: {pattern}")


def unit():
    document("test-report.md", 50)
    require((ROOT/"output/normalizer.py").is_file(), "Missing output/normalizer.py")
    run_tests("test_normalizer.py")
    require((ROOT/"output/test_authored.py").is_file(), "Missing learner-authored test_authored.py")
    count = subprocess.run([sys.executable,"-c", "import unittest; s=unittest.defaultTestLoader.discover('output',pattern='test_authored.py'); print(s.countTestCases()); raise SystemExit(0 if s.countTestCases()>=3 else 1)"], cwd=ROOT, capture_output=True, text=True)
    require(count.returncode == 0, "Need at least three learner-authored unittest cases")
    run_tests("test_authored.py", "output")


def sast():
    document("sast-remediation.md", 50)
    require((ROOT/"output/customer_lookup.py").is_file(), "Missing output/customer_lookup.py")
    run_tests("test_lookup.py")


def sources():
    if (ROOT/"source-manifest.json").is_file():
        manifest = json.loads((ROOT/"source-manifest.json").read_text(encoding="utf-8"))
        require(len(manifest) == 45, "Source file count changed")
        for item in manifest:
            require(hashlib.sha256((ROOT/item['file']).read_bytes()).hexdigest() == item['sha256'], f"Source hash mismatch: {item['file']}")
        print("PASS: 45 prepared source hashes.")
        return
    manifest = json.loads((ROOT/"bank-source/manifest.json").read_text(encoding="utf-8"))
    require(len(manifest) == 45, "Source file count changed")
    for item in manifest:
        for folder, hash_key in (("raw","sha256"),("reading","reading_sha256")):
            data = (ROOT/"bank-source"/folder/item["file"]).read_bytes()
            require(hashlib.sha256(data).hexdigest() == item[hash_key], f"Source hash mismatch: {item['file']}")
    print("PASS: 45 raw and 45 reading source hashes.")


if __name__ == "__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("target", choices=["plan","docs","unit","logs","sast","sources","all"])
    args=parser.parse_args()
    functions={"plan":plan,"docs":docs,"unit":unit,"logs":logs,"sast":sast,"sources":sources}
    try:
        for name in functions if args.target=="all" else [args.target]: functions[name]()
    except (AssertionError, FileNotFoundError, ValueError, KeyError) as exc:
        print(f"FAIL: {exc}", file=sys.stderr); sys.exit(1)
