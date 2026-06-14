# Power BI — Interview Questions

**What is the difference between Power BI Desktop, Power BI Service, and Power BI Mobile?**
Desktop: Windows application for creating reports — connects to data, transforms with Power Query, models data, builds visuals. Free. Service (app.powerbi.com): cloud platform for publishing, sharing, and collaborating on reports. Requires Pro or Premium license for sharing. Mobile: iOS/Android app for viewing reports published to Service. Reports viewed not created. Workflow: build in Desktop, publish to Service, access from Mobile.

**What is DAX and how does it differ from Excel formulas?**
DAX (Data Analysis Expressions): formula language for Power BI, Power Pivot, and SSAS Tabular. Unlike Excel formulas that operate on cells, DAX operates on columns and tables. DAX is context-aware: the same measure returns different values depending on report filters, slicers, and visual context (filter context). Key concepts unique to DAX: CALCULATE() to modify filter context, iterators like SUMX() that process row by row, time intelligence functions (TOTALYTD, SAMEPERIODLASTYEAR), and relationship traversal with RELATED() and RELATEDTABLE().

**What is a star schema and why is it preferred in Power BI?**
Star schema: one fact table (contains measures and foreign keys) surrounded by dimension tables (descriptive attributes). Example: Sales fact table with date_key, product_key, customer_key, quantity, amount. Dimensions: Date (calendar hierarchy), Product (name, category), Customer (name, city, region). Benefits in Power BI: simpler DAX (fewer CALCULATE overrides needed), faster queries (fewer joins), cleaner model. Avoid snowflake schemas (normalized dimensions) — flatten them into single dimension tables for better performance.

**How do you handle row-level security in Power BI?**
RLS restricts data access per user. Steps: Model view → Manage Roles → create role with DAX filter → assign users to role in Power BI Service. Example: Sales Rep sees only their region's data. DAX filter: [Region] = USERPRINCIPALNAME() or [Region] = LOOKUPVALUE(SalesPersons[Region], SalesPersons[Email], USERPRINCIPALNAME()). Dynamic RLS (username-based) is more maintainable than static. Test with "View As Role" in Desktop.
