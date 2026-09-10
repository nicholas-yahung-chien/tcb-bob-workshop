"""Create byte-preserving raw sources and strict UTF-8 reading copies."""
import argparse
import hashlib
import json
from pathlib import Path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", required=True)
    parser.add_argument("--destination", default="customer-source")
    args = parser.parse_args()
    src = Path(args.source).resolve()
    dest = Path(args.destination).resolve()
    files = [src / n for n in ("CKP02.TXT", "STANCVT.TXT", "SYSOCP31.TXT")]
    files += sorted((src / "CIS14").glob("*.TXT"))
    if len(files) != 45 or not all(p.is_file() for p in files):
        raise SystemExit("Expected the supplied 45 TXT files; source set is incomplete")
    manifest = []
    for path in files:
        data = path.read_bytes()
        try:
            text = data.decode("utf-8-sig", errors="strict")
            encoding = "utf-8"
        except UnicodeDecodeError:
            try:
                text = data.decode("cp950", errors="strict")
                encoding = "cp950"
            except UnicodeDecodeError:
                text = data.decode("cp950", errors="backslashreplace")
                encoding = "cp950-with-byte-escapes"
        relative = path.relative_to(src)
        for sub, content in (("raw", data), ("reading", text.encode("utf-8"))):
            target = dest / sub / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            if target.exists() and target.read_bytes() != content:
                raise SystemExit(f"Refusing to replace differing file: {target}")
            target.write_bytes(content)
        manifest.append({"file": relative.as_posix(), "encoding": encoding,
                         "sha256": hashlib.sha256(data).hexdigest(),
                         "reading_sha256": hashlib.sha256(text.encode('utf-8')).hexdigest(),
                         "lines": len(text.splitlines()), "bytes": len(data)})
    (dest / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Imported {len(files)} files. Original bytes preserved; reading copies UTF-8.")
    for item in manifest:
        if "escapes" in item["encoding"]:
            print(f"Encoding exception: {item['file']}; undecodable bytes escaped, not interpreted.")


if __name__ == "__main__": main()
