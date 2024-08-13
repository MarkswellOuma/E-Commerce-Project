/*
This query calculates monthly total sales and assigns a sequential MonthNumber using ROW_NUMBER().
 The DATE_TRUNC function groups by month, and sales are summed for each month.
  The results are ordered chronologically, giving a numbered
 sequence to each month along with its total sales.*/

   SELECT 
    DATE_TRUNC('month', i.InvoiceDate) AS Month, 
    SUM(d.Quantity * p.UnitPrice) AS TotalSales,
    ROW_NUMBER() OVER (ORDER BY DATE_TRUNC('month', i.InvoiceDate)) AS MonthNumber
FROM 
    InvoiceDetails d
JOIN 
    Invoices i ON d.InvoiceNo = i.InvoiceNo
JOIN 
    Products p ON d.StockCode = p.StockCode
GROUP BY 
    Month
ORDER BY 
    Month;
