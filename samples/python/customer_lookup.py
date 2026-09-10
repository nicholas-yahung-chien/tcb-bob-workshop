"""Intentionally vulnerable synthetic exercise. Only use in-memory SQLite."""


def lookup(connection, customer_id):
    sql = "SELECT display_name FROM customers WHERE customer_id = '" + customer_id + "'"
    return connection.execute(sql).fetchall()
