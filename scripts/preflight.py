import pathlib
import shutil
import sys
import subprocess

root = pathlib.Path(__file__).resolve().parents[1]
print("Python:", sys.version.split()[0])
for executable in ("git",):
    found = shutil.which(executable)
    print(f"{executable}: {'available' if found else 'not found (optional when using the ZIP download)'}")
print("Open IBM Bob in VSCode and confirm pp4z is enabled. Python checks use the standard library.")
if sys.version_info < (3,10): raise SystemExit("Python 3.10 or newer required")
for file in ("AGENTS.md","SOURCE-MAP.md","requests/change-application.docx","bank-source/manifest.json"):
    if not (root/file).is_file(): raise SystemExit(f"Missing {file}; clone the complete workshop")
raise SystemExit(subprocess.call([sys.executable,str(root/"scripts/verify.py"),"sources"], cwd=root))
