import unittest
from normalizer import transform, process


class AuthoredChecks(unittest.TestCase):
    def test_preserve_tail(self):
        tail = bytes(range(195)) * 2
        record = b"0012345678" + tail
        self.assertEqual(transform(record), b"12345678  " + tail)

    def test_marker_not_end(self):
        marked = b"0012345678XYZEOF" + b"Q" * 384
        normal = b"0012345678" + b"Q" * 390
        result = process([marked, normal], dry_run=False)
        self.assertEqual(result["records"], [marked, b"12345678  " + b"Q" * 390])
        self.assertEqual(result["total"], 2)

    def test_preview_does_not_mutate(self):
        batch = [b"0012345678" + b"Q" * 390]
        before = batch.copy()
        result = process(batch)
        self.assertEqual(batch, before)
        self.assertEqual(result["records"], before)
        self.assertEqual(result["written"], 0)
        self.assertEqual(result["changed"], 1)
