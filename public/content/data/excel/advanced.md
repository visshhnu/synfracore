# Excel — Advanced

## VBA Automation — the basics before the first real macro

VBA (Visual Basic for Applications) is the programming language built into Excel — everything below is regular code, not a special "Excel formula" dialect, so if this is your first time seeing it, a few concepts first:

- **`Alt+F11`** opens the VBA editor (a separate window from the spreadsheet itself). **`Alt+F8`** opens a dialog to run any macro by name without leaving the spreadsheet.
- A **`Sub`** is a named block of VBA code that performs an action (as opposed to a `Function`, which returns a value you can use in a formula). `Sub FormatMonthlyReport() ... End Sub` below is one complete, runnable macro — everything between those two lines executes when you run it.
- **`Dim`** declares a variable and its type (`Dim lastRow As Long` — a variable named `lastRow` that holds a whole number). **`Set`** assigns an *object* (a worksheet, a range) to a variable — plain `=` is for values, `Set` is specifically for objects, and using the wrong one is a very common first-week VBA error.
- **`.Cells(ws.Rows.Count, "A").End(xlUp).Row`** is the standard VBA idiom for "find the last row that actually has data in column A" — it starts from the very bottom of the sheet and works upward until it hits the first non-empty cell, which is more reliable than a hardcoded row number that breaks the moment the data grows or shrinks.
- **`With ... End With`** lets you set multiple properties on the same object (here, a range) without repeating its name each time — `With ws.Range("A1:F1")` followed by `.Font.Bold = True` is shorthand for `ws.Range("A1:F1").Font.Bold = True`, `ws.Range("A1:F1").Interior.Color = ...`, and so on.

The easiest way to write your first macro without memorizing syntax: **Developer tab → Record Macro**, perform the actions manually in the spreadsheet (format some cells, apply a filter), then stop recording and open the result in the VBA editor (`Alt+F11`) to see the actual code Excel generated. Reading recorded-macro output is a genuinely good way to learn the object model (`Range`, `Worksheet`, `Font`, `Interior`) before writing VBA from scratch.

Once that's comfortable, the macro below is a realistic example — formatting a monthly report's headers and flagging negative values automatically, both things you'd otherwise redo by hand every single month:

```vba
' Automate repetitive tasks with VBA
' Alt+F11 opens VBA editor

Sub FormatMonthlyReport()
    Dim ws As Worksheet
    Dim lastRow As Long
    
    Set ws = ThisWorkbook.Sheets("Data")
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Clear existing formatting
    ws.Range("A1:Z" & lastRow).ClearFormats
    
    ' Header formatting
    With ws.Range("A1:F1")
        .Font.Bold = True
        .Interior.Color = RGB(0, 70, 127)
        .Font.Color = RGB(255, 255, 255)
        .Font.Size = 12
    End With
    
    ' Conditional formatting for negative values
    Dim cfRange As Range
    Set cfRange = ws.Range("C2:C" & lastRow)
    cfRange.FormatConditions.Delete
    
    Dim negCondition As FormatCondition
    Set negCondition = cfRange.FormatConditions.Add(xlCellValue, xlLess, 0)
    negCondition.Font.Color = RGB(255, 0, 0)
    negCondition.Font.Bold = True
    
    ' Auto-fit columns
    ws.Columns("A:F").AutoFit
    
    MsgBox "Report formatted successfully!", vbInformation
End Sub

' Loop through all sheets and create summary
Sub CreateSummary()
    Dim summaryWs As Worksheet
    Dim ws As Worksheet
    Dim i As Integer
    
    ' Create or clear summary sheet
    On Error Resume Next
    Set summaryWs = ThisWorkbook.Sheets("Summary")
    If summaryWs Is Nothing Then
        Set summaryWs = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        summaryWs.Name = "Summary"
    Else
        summaryWs.Cells.Clear
    End If
    On Error GoTo 0
    
    ' Headers
    summaryWs.Range("A1:C1") = Array("Sheet Name", "Total Revenue", "Row Count")
    
    i = 2
    For Each ws In ThisWorkbook.Sheets
        If ws.Name <> "Summary" Then
            summaryWs.Cells(i, 1) = ws.Name
            summaryWs.Cells(i, 2) = Application.Sum(ws.Columns("C"))
            summaryWs.Cells(i, 3) = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row - 1
            i = i + 1
        End If
    Next ws
    
    summaryWs.Columns("A:C").AutoFit
End Sub
```

## Excel Cheatsheet

```excel
-- ── LOOKUP FUNCTIONS ──────────────────────────────────────
=VLOOKUP(val, range, col_num, FALSE)        -- Exact match
=INDEX(return_range, MATCH(val, lookup, 0)) -- More flexible
=XLOOKUP(val, lookup, return, "N/A")        -- Modern (Excel 365)
=HLOOKUP(val, range, row_num, FALSE)        -- Horizontal lookup

-- ── CONDITIONAL ───────────────────────────────────────────
=IF(cond, true_val, false_val)
=IFS(cond1, val1, cond2, val2, TRUE, default)
=SWITCH(expr, val1, result1, val2, result2, default)
=IFERROR(formula, "Error value")
=IFNA(VLOOKUP(...), "Not found")

-- ── AGGREGATION ───────────────────────────────────────────
=SUMIF(range, criteria, sum_range)
=SUMIFS(sum_range, crit_range1, crit1, crit_range2, crit2)
=COUNTIF(range, criteria)
=COUNTIFS(range1, crit1, range2, crit2)
=AVERAGEIFS(avg_range, crit_range, criteria)
=MAXIFS(max_range, crit_range, criteria)    -- Excel 2019+
=MINIFS(min_range, crit_range, criteria)

-- ── TEXT ──────────────────────────────────────────────────
=CONCAT(A1," ",B1)                          -- Combine text
=TEXTJOIN(", ", TRUE, A1:A10)              -- Join with delimiter
=TEXT(A1,"$#,##0.00")                      -- Format as text
=TRIM(A1)                                   -- Remove extra spaces
=CLEAN(A1)                                  -- Remove non-printable
=PROPER(A1) / UPPER(A1) / LOWER(A1)
=LEFT(A1,5) / RIGHT(A1,3) / MID(A1,2,4)
=FIND("@",A1) / SEARCH("@",A1)            -- Case-sensitive vs not
=SUBSTITUTE(A1,"old","new")

-- ── DATE ──────────────────────────────────────────────────
=TODAY() / NOW()
=DATE(year,month,day)
=YEAR(A1) / MONTH(A1) / DAY(A1)
=DATEDIF(start,end,"D") / ("M") / ("Y")
=EOMONTH(A1,0)                             -- Last day of month
=WORKDAY(A1,5)                             -- 5 business days ahead
=NETWORKDAYS(start,end)                    -- Working days between

-- ── SHORTCUTS ─────────────────────────────────────────────
Ctrl+T          Convert to Table (auto-filter, structured refs)
Ctrl+Shift+L    Toggle filters
Alt+=           AutoSum
F4              Toggle $A$1/$A1/A$1/A1 (absolute/relative)
Ctrl+D/R        Fill down/right
Ctrl+;          Insert today's date
Alt+Enter       New line in cell
Ctrl+1          Format Cells dialog
```
