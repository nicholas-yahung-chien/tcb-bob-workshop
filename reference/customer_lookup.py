"""Reference implementation for the synthetic SQLite exercise."""


def lookup(connection, customer_id):
    return connection.execute(
        "SELECT display_name FROM customers WHERE customer_id = ?", (customer_id,)
    ).fetchall()
