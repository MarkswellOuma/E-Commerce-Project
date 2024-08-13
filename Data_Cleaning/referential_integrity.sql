-- Remove orphan Records
-- Remove rows in InvoiceDetails with no matching InvoiceNo in Invoices
DELETE FROM InvoiceDetails
WHERE InvoiceNo NOT IN (SELECT InvoiceNo FROM Invoices);

-- Remove rows in InvoiceDetails with no matching StockCode in Products
DELETE FROM InvoiceDetails
WHERE StockCode NOT IN (SELECT StockCode FROM Products);



----validation and verification


-- Check for any orphaned rows in InvoiceDetails after cleaning
SELECT * FROM InvoiceDetails
WHERE InvoiceNo NOT IN (SELECT InvoiceNo FROM Invoices);

-- Ensure all InvoiceNo in InvoiceDetails exist in Invoices
SELECT * FROM InvoiceDetails
WHERE StockCode NOT IN (SELECT StockCode FROM Products);

