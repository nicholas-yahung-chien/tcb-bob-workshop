"""Synthetic ASCII byte model. Implement only in output/normalizer.py."""


def transform(record: bytes) -> bytes:
    raise NotImplementedError("Read specs/testing.md; implement in output/")


def process(records: list[bytes], dry_run: bool = True) -> dict:
    raise NotImplementedError("Read specs/testing.md; implement in output/")
