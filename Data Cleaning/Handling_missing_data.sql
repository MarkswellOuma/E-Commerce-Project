





-- Check for rows with missing CustomerID in Invoices
SELECT * FROM Invoices WHERE CustomerID IS NULL;

-- Check for rows with missing Description in Products
SELECT * FROM Products WHERE Description IS NULL;






/*If you want to delete the corresponding rows in InvoiceDetails when you delete a row in Invoices,
 you can set up a ON DELETE CASCADE constraint. This way, when a row in Invoices is deleted,
  all related rows in InvoiceDetails are automatically deleted.

First, you need to alter your foreign key constraint:*/

ALTER TABLE InvoiceDetails
DROP CONSTRAINT invoicedetails_invoiceno_fkey;

ALTER TABLE InvoiceDetails
ADD CONSTRAINT invoicedetails_invoiceno_fkey
FOREIGN KEY (InvoiceNo) REFERENCES Invoices(InvoiceNo) 
ON DELETE CASCADE;

--If CustomerID or Description is missing, you might delete those rows

DELETE FROM Invoices WHERE CustomerID IS NULL;
DELETE FROM Products WHERE Description IS NULL;

