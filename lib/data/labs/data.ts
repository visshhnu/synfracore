export const runtime = "edge";

export type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

export type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

export type TechLabs = {
  [techSlug: string]: Lab[];
};

export const labs_data: TechLabs = {
"pandas": [
  { id: "pd-lab-1", title: "Pandas: Real Data Analysis Workflow", difficulty: "Intermediate", duration: "30 min",
    tools: ["python", "pandas"], objective: "Load, clean, transform, analyze real data and generate insights",
    interface: "code-editor",
    steps: [
      { id: "pd1", title: "Load and profile data", type: "code",
        description: "Always start by understanding your data before analyzing it.",
        language: "python",
        code: `import pandas as pd
import numpy as np

# Create realistic sales dataset
np.random.seed(42)
df = pd.DataFrame({
    'date': pd.date_range('2024-01-01', periods=1000, freq='h'),
    'product': np.random.choice(['Laptop','Mouse','Keyboard','Monitor'], 1000),
    'category': np.random.choice(['Electronics','Accessories'], 1000),
    'quantity': np.random.randint(1, 10, 1000),
    'price': np.random.choice([89999, 2499, 4999, 45999], 1000),
    'region': np.random.choice(['North','South','East','West'], 1000),
    'returned': np.random.choice([True, False], 1000, p=[0.05, 0.95])
})
# Introduce some missing values
df.loc[np.random.choice(1000, 50), 'quantity'] = np.nan

print("Shape:", df.shape)
print("\nDtypes:\n", df.dtypes)
print("\nMissing values:\n", df.isnull().sum())
print("\nSample:\n", df.head())
print("\nStats:\n", df.describe())`,
        explanation: "Profile first: shape (rows/cols), dtypes (number vs string), missing values, and basic stats. This tells you data quality issues before wasting time on bad analysis." },
      { id: "pd2", title: "Clean and analyze", type: "code",
        description: "Handle missing data and generate business insights with groupby.",
        language: "python",
        code: `# Handle missing values
df['quantity'] = df['quantity'].fillna(df.groupby('product')['quantity'].transform('median'))
df['revenue'] = df['quantity'] * df['price']

# Time-based analysis
df['month'] = df['date'].dt.month
df['hour'] = df['date'].dt.hour
df['weekday'] = df['date'].dt.day_name()

print("=== REVENUE BY PRODUCT ===")
by_product = df.groupby('product').agg(
    revenue=('revenue','sum'),
    units=('quantity','sum'),
    orders=('product','count'),
    return_rate=('returned','mean')
).sort_values('revenue', ascending=False)
print(by_product.round(2))

print("\n=== PEAK HOURS ===")
print(df.groupby('hour')['revenue'].mean().nlargest(5))

print("\n=== REGIONAL PERFORMANCE ===")
print(df.pivot_table(values='revenue', index='region', columns='category', aggfunc='sum').round(0))`,
        explanation: "fillna with group median is smarter than overall median. agg() with named aggregations is readable. pivot_table creates cross-tabulations. nlargest() is faster than sort_values().head()." },
    ],
  },
],

// ═══ DATA: EXCEL ═══

"excel": [
  { id: "excel-lab-1", title: "Excel: VLOOKUP, Pivot Tables, Dashboard", difficulty: "Beginner", duration: "20 min",
    tools: ["excel"], objective: "Master the three most valuable Excel skills for data analysis",
    interface: "none",
    steps: [
      { id: "ex1", title: "VLOOKUP and XLOOKUP", type: "info",
        description: "The most-used Excel functions — look up values across tables.",
        code: `-- VLOOKUP syntax:
=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])

-- Example: Find employee salary from salary table
=VLOOKUP(A2, SalaryTable!A:C, 3, FALSE)
-- A2: Employee ID to look up
-- SalaryTable!A:C: Where to search (first column = ID, third = Salary)
-- 3: Return 3rd column
-- FALSE: Exact match (always use FALSE!)

-- XLOOKUP (Excel 365) - better alternative:
=XLOOKUP(A2, SalaryTable!A:A, SalaryTable!C:C, "Not Found")
-- Simpler syntax, no column counting
-- Returns "Not Found" if no match

-- INDEX+MATCH (works in all Excel versions):
=INDEX(SalaryTable!C:C, MATCH(A2, SalaryTable!A:A, 0))`,
        explanation: "VLOOKUP limitation: can only look right. Use XLOOKUP or INDEX/MATCH for flexibility. The most common error: forgetting FALSE at the end (FALSE=exact match, TRUE=approximate)." },
      { id: "ex2", title: "PivotTable for instant summaries", type: "info",
        description: "Turn thousands of rows into insights in 60 seconds.",
        code: `Steps to create a PivotTable:
1. Click any cell in your data
2. Insert → PivotTable → New Worksheet (OK)
3. Drag fields to areas:
   ROWS:    What to group by (Product, Region)
   COLUMNS: Optional cross-tab (Month, Year)
   VALUES:  What to calculate (Sum of Sales)
   FILTERS: Top-level filter (Year, Department)

Useful features:
  - Values As → % of Grand Total (instant market share)
  - Group dates by Month/Quarter (right-click date → Group)
  - Slicers: Insert → Slicer (interactive filter buttons)
  - Calculated Field: Analyze → Fields → Profit Margin = Revenue - Cost

PivotChart:
  - Click PivotTable → Insert → PivotChart
  - Chart updates when you change PivotTable filters`,
        explanation: "PivotTables don't modify source data — safe to experiment. Refresh with right-click → Refresh when data changes. Master PivotTables and you can answer 80% of business analysis questions." },
    ],
  },
],

// ═══ DATA: POWER BI ═══

"power-bi": [
  { id: "pbi-lab-1", title: "Power BI: DAX and Dashboard Design", difficulty: "Intermediate", duration: "30 min",
    tools: ["power-bi-desktop"], objective: "Write DAX measures, create relationships, build an interactive dashboard",
    interface: "none",
    steps: [
      { id: "pbi1", title: "Essential DAX measures", type: "code",
        description: "DAX is Power BI's formula language — master these patterns for any dashboard.",
        language: "sql",
        code: `-- Basic aggregation measures
Total Revenue = SUM(Sales[Amount])
Total Orders = COUNTROWS(Sales)
Avg Order Value = DIVIDE([Total Revenue], [Total Orders], 0)

-- Time intelligence (requires a proper Date table!)
Revenue MTD = TOTALMTD([Total Revenue], 'Date'[Date])
Revenue YTD = TOTALYTD([Total Revenue], 'Date'[Date])
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('Date'[Date]))
YoY Growth % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])

-- Conditional measures
High Value Orders = CALCULATE([Total Orders], Sales[Amount] > 10000)

-- Using CALCULATE (most powerful DAX function)
-- Modifies the filter context
North Revenue = CALCULATE([Total Revenue], Geography[Region] = "North")

-- Rank products by revenue
Product Rank = RANKX(ALL('Product'), [Total Revenue], , DESC)

-- Variables for readability
Profit Margin =
VAR Revenue = [Total Revenue]
VAR Cost = SUM(Sales[Cost])
RETURN DIVIDE(Revenue - Cost, Revenue, 0)`,
        explanation: "CALCULATE is the heart of DAX — it changes the filter context. Time intelligence functions require a marked Date table with continuous dates. DIVIDE handles division by zero gracefully." },
      { id: "pbi2", title: "Dashboard design principles", type: "info",
        description: "Apply these 5 rules to create dashboards executives actually use.",
        code: `5 Rules for Effective Power BI Dashboards:

1. ONE KEY MESSAGE per dashboard
   Bad:  "Sales Dashboard" (everything)
   Good: "Which regions need intervention this quarter?"

2. MOST IMPORTANT METRIC → TOP LEFT
   Eyes track top-left first. Put your KPIs there.
   Card visuals for: Revenue, Orders, Growth %, Target %

3. CONSISTENT COLORS
   Green = good/positive, Red = bad/negative, Blue = neutral
   Never use rainbow colors — one color family per chart

4. MAXIMIZE DATA-INK RATIO
   Remove: gridlines, borders, background colors
   Keep: only what carries information
   White space is your friend

5. SLICERS ARE FREE REAL ESTATE
   Date slicer (Timeline): filter everything by date
   Region slicer: connected to all visuals at once
   Sync slicers across pages: View → Sync Slicers`,
        explanation: "Most dashboards fail not because of wrong data but poor design. Executives stop using dashboards that are cluttered or require too much work to extract insight." },
    ],
  },
],

// ═══ DATA: TABLEAU ═══

"tableau": [
  { id: "tab-lab-1", title: "Tableau: Charts, Filters, and LOD", difficulty: "Intermediate", duration: "30 min",
    tools: ["tableau-desktop"], objective: "Build calculated fields, use LOD expressions, create interactive dashboards",
    interface: "none",
    steps: [
      { id: "tab1", title: "Calculated fields", type: "code",
        description: "Tableau's formula language for custom metrics and categorizations.",
        language: "sql",
        code: `// Basic calculations
Revenue = [Quantity] * [Unit Price]
Profit Margin = [Profit] / [Revenue]
Days Since Order = DATEDIFF('day', [Order Date], TODAY())

// Conditional (IF/ELSE)
Customer Tier =
IF [Revenue] > 100000 THEN "Platinum"
ELSEIF [Revenue] > 50000 THEN "Gold"
ELSEIF [Revenue] > 10000 THEN "Silver"
ELSE "Bronze" END

// String manipulation
Full Name = UPPER([First Name]) + " " + UPPER([Last Name])
Email Domain = MID([Email], FIND("@", [Email]) + 1, LEN([Email]))

// LOD (Level of Detail) expressions
// FIXED: compute at specific granularity regardless of view
Customer Lifetime Value = {FIXED [Customer ID]: SUM([Revenue])}

// Revenue as % of customer's total
Revenue Share = [Revenue] / {FIXED [Customer ID]: SUM([Revenue])}

// INCLUDE: add detail
Avg Customer Revenue Per Region = {INCLUDE [Customer ID]: AVG(SUM([Revenue]))}`,
        explanation: "LOD expressions are Tableau's superpower. FIXED ignores the current view's granularity. Use it for: % of total, customer averages, cohort analysis. Test with Explain Data to verify calculations." },
    ],
  },
],

// ═══ SECURITY: NETWORK SECURITY ═══
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_data[tech] || [];
}
