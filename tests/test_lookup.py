import importlib.util
import pathlib
import sqlite3
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("learner_lookup", ROOT / "output/customer_lookup.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class LookupContract(unittest.TestCase):
    def setUp(self):
        self.db = sqlite3.connect(":memory:")
        self.db.execute("CREATE TABLE customers (customer_id TEXT, display_name TEXT)")
        self.db.executemany("INSERT INTO customers VALUES (?, ?)", [("DEMO-01", "Alpha"), ("DEMO-02", "Beta"), ("O'NEIL", "Quoted")])

    def tearDown(self): self.db.close()

    def test_exact(self): self.assertEqual(module.lookup(self.db, "DEMO-01"), [("Alpha",)])
    def test_unknown(self): self.assertEqual(module.lookup(self.db, "missing"), [])
    def test_quote(self): self.assertEqual(module.lookup(self.db, "O'NEIL"), [("Quoted",)])
    def test_injection(self): self.assertEqual(module.lookup(self.db, "' OR 1=1 --"), [])
    def test_table_survives(self):
        self.assertEqual(module.lookup(self.db, "'; DROP TABLE customers; --"), [])
        self.assertEqual(self.db.execute("SELECT count(*) FROM customers").fetchone()[0], 3)

    def test_binding_contract(self):
        class Recorder:
            def execute(self, sql, parameters=()):
                self.sql, self.parameters = sql, parameters
                return self
            def fetchall(self): return []
        fake = Recorder()
        module.lookup(fake, "UNTRUSTED-VALUE")
        self.assertNotIn("UNTRUSTED-VALUE", fake.sql)
        self.assertIn("UNTRUSTED-VALUE", fake.parameters)
