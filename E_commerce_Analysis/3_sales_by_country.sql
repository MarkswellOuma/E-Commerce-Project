
SELECT 
    i.Country, 
    SUM(id.Quantity) AS TotalQuantitySold,          -- Total quantity of products sold in each country
    SUM(id.Quantity * p.UnitPrice) AS TotalRevenue, -- Total revenue generated from each country
    COUNT(DISTINCT i.InvoiceNo) AS NumberOfInvoices -- Number of distinct invoices per country
FROM 
    InvoiceDetails id
JOIN 
    Invoices i ON id.InvoiceNo = i.InvoiceNo
JOIN 
    Products p ON id.StockCode = p.StockCode
GROUP BY 
    i.Country
HAVING 
    SUM(id.Quantity) > 0 -- Ensure that only countries with sales are included
ORDER BY 
    TotalRevenue DESC,    -- First order by total revenue
    TotalQuantitySold DESC -- Then by total quantity sold;
