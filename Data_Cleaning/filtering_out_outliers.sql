-- Identify rows with invalid Quantity in InvoiceDetails
SELECT * FROM InvoiceDetails WHERE Quantity <= 0;

-- Identify rows with invalid UnitPrice in Products
SELECT * FROM Products WHERE UnitPrice <= 0;

-- Remove rows with Quantity <= 0 in InvoiceDetails
DELETE FROM InvoiceDetails WHERE Quantity <= 0;

-- Remove rows with UnitPrice <= 0 in Products
DELETE FROM Products WHERE UnitPrice <= 0;




