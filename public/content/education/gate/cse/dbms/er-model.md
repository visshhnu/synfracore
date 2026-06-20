# ER Model

## Why This Chapter Matters
ER Model appears in GATE DBMS every year — 4-6 marks. Mapping constraints (cardinality), ER to relational schema conversion, and weak entities are favourite questions.

## Core Concepts

### 1. ER Diagram Components

**Entity:** Real-world object (STUDENT, COURSE)
**Attribute:** Property of entity (Name, Age)
  - Simple vs Composite (Name = First+Last)
  - Single-valued vs Multi-valued ({Phone})
  - Derived (Age from DateOfBirth)
  - Key attribute (underlined in ER diagram)

**Relationship:** Association between entities (STUDENT ENROLLS IN COURSE)
**Weak Entity:** Cannot be identified by own attributes alone. Needs identifying (owner) entity.
  - Has partial key (dashed underline)
  - Has identifying relationship

### 2. Cardinality Constraints
**1:1** (One-to-One): Each entity in A relates to at most one in B.
**1:N** (One-to-Many): One entity in A relates to many in B.
**M:N** (Many-to-Many): Many in A relate to many in B.

**Participation constraints:**
Total participation (double line): every entity must participate.
Partial participation (single line): participation is optional.

### 3. ER to Relational Schema Mapping

**Strong Entity:** Becomes a table. Attributes become columns. Key becomes primary key.

**1:1 Relationship:** Merge tables or add foreign key to either side. Use total participation side to add FK.

**1:N Relationship:** Add FK to N-side table. (FK references PK of 1-side)

**M:N Relationship:** Create new table with FKs referencing both entities' PKs.

**Weak Entity:** Table includes partial key + FK to owner entity. PK = (partial key + FK).

**Multi-valued attribute:** Create separate table. PK = (entity PK + attribute value).

## PYQs
**GATE 2024:** ER diagram with M:N relationship. How many tables result after conversion?
For M:N: 2 entity tables + 1 relationship table = minimum 3 tables.

**GATE 2023:** Weak entity DEPENDENT has partial key = NAME. Owner entity EMPLOYEE has PK = EID. What is PK of DEPENDENT table?
PK = (EID, NAME) — combination of owner's PK and weak entity's partial key.

**GATE 2022:** When should FK be placed in 1:1 relationships?
Prefer to place FK in the table with total participation (to minimize NULLs).

## Revision Notes
```
ENTITY: strong (own key) vs weak (needs owner)
ATTRIBUTE types: simple, composite, multi-valued, derived, key

CARDINALITY:
1:1 -> add FK to one side (prefer total participation side)
1:N -> add FK to N-side
M:N -> new table with both FKs as composite PK

WEAK ENTITY: PK = (partial_key, FK_to_owner)
MULTI-VALUED ATTR: new table, PK = (entity_PK, attribute_value)
```
