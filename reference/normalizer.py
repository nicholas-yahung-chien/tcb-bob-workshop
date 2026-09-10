"""Reference implementation: pure ASCII-byte teaching model, no mainframe I/O."""


def transform(record: bytes) -> bytes:
    if not isinstance(record, bytes) or len(record) != 400:
        raise ValueError("record must be exactly 400 bytes")
    if record[:2] == b"00" and record[13:16] != b"EOF":
        return record[2:10] + b"  " + record[10:]
    return record


def process(records: list[bytes], dry_run: bool = True) -> dict:
    if not isinstance(records, list):
        raise ValueError("records must be a list of bytes")
    if not isinstance(dry_run, bool):
        raise ValueError("dry_run must be bool")
    for record in records:
        if not isinstance(record, bytes) or len(record) != 400:
            raise ValueError("every record must be exactly 400 bytes")
    converted = [transform(record) for record in records]
    eligible = sum(r[:2] == b"00" and r[13:16] != b"EOF" for r in records)
    changed = sum(before != after for before, after in zip(records, converted))
    return {"records": list(records) if dry_run else converted,
            "total": len(records), "eligible": eligible, "changed": changed,
            "unchanged": len(records)-changed, "written": 0 if dry_run else changed,
            "dry_run": dry_run}
