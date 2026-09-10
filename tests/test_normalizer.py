"""Independent acceptance vectors for the synthetic behavior model."""
import importlib.util
import pathlib
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("learner_normalizer", ROOT / "output/normalizer.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def record(key=b"0012345678", marker=b"ABC"):
    value = bytearray((bytes(range(256)) * 2)[:400])
    value[:10] = key
    value[13:16] = marker
    return bytes(value)


class NormalizerContract(unittest.TestCase):
    def test_full_record_and_suffix_preserved(self):
        src = record()
        self.assertEqual(module.transform(src), b"12345678  " + src[10:])

    def test_marker_exact_position(self):
        src = record(marker=b"EOF")
        self.assertEqual(module.transform(src), src)

    def test_nearby_marker_does_not_skip(self):
        src = bytearray(record()); src[12:15] = b"EOF"; src = bytes(src)
        self.assertEqual(module.transform(src), b"12345678  " + src[10:])

    def test_noneligible(self):
        src = record(b"AB12345678")
        self.assertEqual(module.transform(src), src)

    def test_no_numeric_validation(self):
        src = record(b"00ABCDEFGH")
        self.assertEqual(module.transform(src), b"ABCDEFGH  " + src[10:])

    def test_invalid_inputs(self):
        for src in (b"", b"X" * 399, b"X" * 401, "X" * 400, bytearray(400), None):
            with self.subTest(type=type(src), length=len(src) if src is not None else 0):
                with self.assertRaises(ValueError): module.transform(src)

    def test_batch_dry_run_and_write(self):
        batch = [record(), record(marker=b"EOF"), record(b"AB12345678"), record()]
        snapshot = batch.copy()
        for dry in (True, False):
            result = module.process(batch, dry_run=dry)
            self.assertEqual(set(result), {"records", "total", "eligible", "changed", "unchanged", "written", "dry_run"})
            for key, val in {"total": 4, "eligible": 2, "changed": 2, "unchanged": 2, "written": 0 if dry else 2, "dry_run": dry}.items():
                self.assertEqual(result[key], val, key)
            expected = snapshot if dry else [b"12345678  " + batch[0][10:], batch[1], batch[2], b"12345678  " + batch[3][10:]]
            self.assertEqual(result["records"], expected)
            self.assertIsNot(result["records"], batch)
            self.assertEqual(batch, snapshot)

    def test_eligible_with_spaces(self):
        src = record(b"00        ")
        result = module.process([src], dry_run=False)
        self.assertEqual(result["eligible"], 1)
        self.assertEqual(result["changed"], 1)

    def test_empty(self):
        self.assertEqual(module.process([]), {"records": [], "total": 0, "eligible": 0, "changed": 0, "unchanged": 0, "written": 0, "dry_run": True})

    def test_all_inputs_validated(self):
        batch = [record(), b"bad"]
        snapshot = batch.copy()
        with self.assertRaises(ValueError): module.process(batch, dry_run=False)
        self.assertEqual(batch, snapshot)

    def test_repeated_application_can_change_again(self):
        src = record(b"0000123456")
        once = module.transform(src)
        twice = module.transform(once)
        self.assertEqual(once[:10], b"00123456  ")
        self.assertEqual(twice[:10], b"123456    ")
        self.assertNotEqual(once, twice)
