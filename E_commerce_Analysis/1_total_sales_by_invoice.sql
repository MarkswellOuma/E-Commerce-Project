--Explanation:
--JOIN InvoiceDetails with Products:

--The query joins the InvoiceDetails table with the Products table on StockCode to access the unit price of each product.
--JOIN InvoiceDetails with Invoices:

--The query then joins InvoiceDetails with the Invoices table on InvoiceNo to group sales by each invoice.
---Calculate Total Sales:

--SUM(id.Quantity * p.UnitPrice) AS TotalSales: This calculates the total sales for each invoice by multiplying the quantity of each product by its unit price and summing these values.
--Group by Invoice Number:

--GROUP BY i.InvoiceNo: Groups the results by each InvoiceNo, so you get the total sales for each invoice.
--Order by Total Sales:

--ORDER BY TotalSales DESC: Orders the results by total sales in descending order, showing the invoices with the highest sales first.


SELECT 
    i.InvoiceNo, 
    SUM(d.Quantity * p.UnitPrice) AS TotalSales
FROM 
    InvoiceDetails d
JOIN 
    Products p ON d.StockCode = p.StockCode
JOIN 
    Invoices i ON d.InvoiceNo = i.InvoiceNo
GROUP BY 
    i.InvoiceNo
ORDER BY 
    TotalSales DESC;
