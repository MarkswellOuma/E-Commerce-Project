
-- Find potential duplicate rows in Invoices
SELECT InvoiceNo, COUNT(*)
FROM Invoices
GROUP BY InvoiceNo
HAVING COUNT(*) > 1;

-- Find potential duplicate rows in Products
SELECT StockCode, Description, UnitPrice, COUNT(*)
FROM Products
GROUP BY StockCode, Description, UnitPrice
HAVING COUNT(*) > 1;

/*This code removes duplicate rows from the Invoices and Products,
  tables. For each table, it groups rows based on 
unique identifiers (InvoiceNo, StockCode, Description, UnitPrice, Quantity), 
selects the row with the smallest ctid (indicating the first physical occurrence), 
and deletes all other rows with the same identifiers. This process ensures only one 
instance of each duplicate remains in the tables.*/

DELETE FROM Invoices
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM Invoices
    GROUP BY InvoiceNo
);

DELETE FROM Products
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM Products
    GROUP BY StockCode, Description, UnitPrice
);
