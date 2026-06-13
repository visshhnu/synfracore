# Oracle Database — Cheatsheet

```sql
-- ── CONNECTION ─────────────────────────────────────────────
sqlplus user/pass@host:1521/SID
sqlplus / as sysdba                 -- local DBA connection
SET SERVEROUTPUT ON                 -- show DBMS_OUTPUT
SET LINESIZE 200 PAGESIZE 100

-- ── DESCRIBE / CATALOG ────────────────────────────────────
DESC tablename                      -- table structure
SELECT * FROM USER_TABLES;          -- your tables
SELECT * FROM ALL_TABLES;           -- all accessible tables
SELECT * FROM DBA_TABLES;           -- all tables (DBA only)
SELECT * FROM USER_INDEXES WHERE TABLE_NAME='EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP';
SELECT * FROM USER_PROCEDURES;

-- ── ORACLE DATE FUNCTIONS ─────────────────────────────────
SYSDATE                             -- current date+time
SYSTIMESTAMP                        -- with timezone
TO_DATE('15-01-2024','DD-MM-YYYY')  -- string to date
TO_CHAR(SYSDATE,'DD-MON-YYYY')      -- date to string
ADD_MONTHS(SYSDATE, 3)              -- add 3 months
LAST_DAY(SYSDATE)                   -- last day of month
NEXT_DAY(SYSDATE, 'MONDAY')         -- next Monday
TRUNC(SYSDATE, 'MM')                -- first of current month
MONTHS_BETWEEN(d1, d2)             -- months between dates
EXTRACT(YEAR FROM SYSDATE)          -- extract component

-- ── ORACLE STRING FUNCTIONS ───────────────────────────────
SUBSTR(str, start, len)             -- SUBSTR('Hello',1,3) = 'Hel' (1-indexed!)
INSTR(str, substr)                  -- position of substr
LENGTH(str)                         -- string length
UPPER/LOWER/INITCAP(str)            -- case
LTRIM/RTRIM/TRIM(str)               -- remove spaces/chars
LPAD('42',5,'0') = '00042'          -- left pad
RPAD('X',5,'-') = 'X----'          -- right pad
REPLACE(str, old, new)
REGEXP_SUBSTR(str, pattern)         -- regex extraction
CONCAT(s1, s2) or s1 || s2         -- concatenation

-- ── NULL HANDLING ─────────────────────────────────────────
NVL(expr, default)                  -- replace NULL
NVL2(expr, not_null_val, null_val)  -- conditional on NULL
NULLIF(e1, e2)                      -- NULL if e1=e2
COALESCE(e1,e2,e3)                  -- first non-NULL

-- ── SEQUENCES ─────────────────────────────────────────────
CREATE SEQUENCE seq START WITH 1 INCREMENT BY 1 NOCACHE;
seq.NEXTVAL                         -- next value
seq.CURRVAL                         -- current (within session)
ALTER SEQUENCE seq INCREMENT BY 10;
DROP SEQUENCE seq;

-- ── COMMON ADMIN ──────────────────────────────────────────
ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY HH24:MI:SS';
GRANT SELECT ON schema.table TO user;
CREATE SYNONYM emp FOR hr.employees;
EXEC DBMS_STATS.GATHER_TABLE_STATS('HR','EMPLOYEES');
ALTER TABLE t ADD CONSTRAINT pk PRIMARY KEY (id);
CREATE INDEX idx ON t(col1, col2);
CREATE INDEX idx ON t(UPPER(email));       -- function-based index
ALTER INDEX idx REBUILD;                   -- rebuild fragmented index
```
