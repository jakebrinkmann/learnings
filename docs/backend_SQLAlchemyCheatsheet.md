# SQLAlchemy Postgresql CheatSheet (sql)


  - https://www.pythonsheets.com/notes/python-sqlalchemy.html
  - https://docs.sqlalchemy.org/en/13/core/tutorial.html
  - https://docs.sqlalchemy.org/en/13/orm/tutorial.html
  - https://docs.sqlalchemy.org/en/13/orm/session_basics.html#session-faq-whentocreate

`pip install psycopg2-binary sqlalchemy`

```python
import functools

from sqlalchemy.engine.url import URL
import sqlalchemy as sa

@functools.lru_cache()
def getConnection(drivername, username, password, host, port, database, db_ssl_mode="prefer"):
    dsn=URL(drivername, username, password, host, port, database)
    connect_args={"sslmode": db_ssl_mode}

    engine=create_engine(dsn, connect_args=connect_args, implicit_returning=False)

    return engine.connect()


def compileQuery(query):
    """Via http://nicolascadou.com/blog/2014/01/printing-actual-sqlalchemy-queries"""
    compiler=query.compileifnothasattr(query, "statement") elsequery.statement.compile
    returncompiler(dialect=postgresql.dialect(), compile_kwargs={"literal_binds": True})

# Core
metadata=MetaData()
table_name=Table(
    "table_name",
    metadata,
    Column("id", BigInteger),
    schema="schema",
)


def transaction(stmt):
    conn=getConnection()
    trans=conn.begin()

    try:
        conn.execute(stmt)
        trans.commit()
    except Exception as exc:
        trans.rollback()
    raise


def recyle(stmt):
    try:
        transaction(stmt)
    except sa.exc.OperationalError as err:
        if err.connection_invalidated:
            transaction(stmt)
        else raise

def __easy_stmt():
    return sa.text("""
            INSERT INTO schema.table (id, filename, package_type)
            VALUES (:id, :fid, :pid)
            ON CONFLICT (id)
            DO UPDATE SET filename = EXCLUDED.filename""")
```
