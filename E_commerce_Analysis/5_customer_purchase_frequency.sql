/*This query calculates the purchase frequency for each customer by counting 
distinct invoices (InvoiceNo) associated with each CustomerID. The results are
 grouped by CustomerID and ordered by purchase frequency in descending order,
showing how often each customer made a purchase.*/

SELECT 
    i.CustomerID, 
    COUNT(DISTINCT i.InvoiceNo) AS PurchaseFrequency
FROM 
    Invoices i
GROUP BY 
    i.CustomerID
ORDER BY 
    PurchaseFrequency DESC;
