/*This query calculates product performance by country, summing total 
sales (quantity times unit price) for each product in each country. 
The results are grouped by Country, StockCode, and Description, then ordered
 by country and total sales in descending order, showing the performance
 of each product in different countries.*/

 SELECT 
    i.Country, 
    p.StockCode, 
    p.Description, 
    SUM(d.Quantity * p.UnitPrice) AS TotalSales
FROM 
    InvoiceDetails d
JOIN 
    Invoices i ON d.InvoiceNo = i.InvoiceNo
JOIN 
    Products p ON d.StockCode = p.StockCode
GROUP BY 
    i.Country, p.StockCode, p.Description
ORDER BY 
    i.Country, TotalSales DESC;
