/*This query calculates total sales for each customer by summing the product of Quantity and UnitPrice. 
The results are grouped by CustomerID and ordered by TotalSales in descending order, 
showing the top customers by sales.
 Adjust the LIMIT clause to display the desired number of top customers.*/

 SELECT 
    i.CustomerID, 
    SUM(d.Quantity * p.UnitPrice) AS TotalSales
FROM 
    InvoiceDetails d
JOIN 
    Invoices i ON d.InvoiceNo = i.InvoiceNo
JOIN 
    Products p ON d.StockCode = p.StockCode
GROUP BY 
    i.CustomerID
ORDER BY 
    TotalSales DESC
LIMIT 25;  
