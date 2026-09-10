import pathlib
import shutil
import sys
import subprocess

root = pathlib.Path(__file__).resolve().parents[1]
print("Python:", sys.version.split()[0])
for executable in ("git", "bob", "cobc"):
    found = shutil.which(executable)
    print(f"{executable}: {'available' if found else 'not found'}")
print("COBOL compiler is optional; model tests use Python 3.10+.")
if sys.version_info < (3,10): raise SystemExit("Python 3.10 or newer required")
for file in ("AGENTS.md","SOURCE-MAP.md","specs/change-request.md","bank-source/manifest.json"):
    if not (root/file).is_file(): raise SystemExit(f"Missing {file}; clone the complete workshop")
raise SystemExit(subprocess.call([sys.executable,str(root/"scripts/verify.py"),"sources"], cwd=root))
