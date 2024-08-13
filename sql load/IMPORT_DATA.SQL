-- Inserting data into the staging table
copy StagingTable FROM 'C:\Users\Admin\E-Commerce Project\.vscode\E_commerce_data.csv' DELIMITER ',' CSV HEADER ENCODING 'LATIN1';

---Before importing the data, identify and remove duplicate InvoiceNo values in the staging table or in the original CSV file.
-- Find duplicate InvoiceNo values
SELECT InvoiceNo, COUNT(*)
FROM StagingTable
GROUP BY InvoiceNo
HAVING COUNT(*) > 1;

--since there are duplicate invoiceNo and they might affect my analysis, I droped them
DELETE FROM StagingTable
WHERE InvoiceNo IN (
    SELECT InvoiceNo
    FROM (
        SELECT InvoiceNo, ROW_NUMBER() OVER (PARTITION BY InvoiceNo ORDER BY InvoiceNo) AS rn
        FROM StagingTable
    ) AS t
    WHERE t.rn > 1
);----check if there are still duplicate data

SELECT *
FROM stagingtable



---Now import data to each of the tables created

INSERT INTO Invoices (InvoiceNo, InvoiceDate, CustomerID, Country)  ----import data into Invoices before Products
SELECT DISTINCT InvoiceNo, InvoiceDate, CustomerID, Country
FROM StagingTable
WHERE InvoiceNo IS NOT NULL;

INSERT INTO Products (StockCode, Description, UnitPrice)
SELECT DISTINCT StockCode, Description, UnitPrice
FROM StagingTable
WHERE StockCode IS NOT NULL;

INSERT INTO InvoiceDetails (InvoiceNo, StockCode, Quantity)
SELECT InvoiceNo, StockCode, Quantity
FROM StagingTable
WHERE InvoiceNo IS NOT NULL
  AND StockCode IS NOT NULL;

-----Test if the data was corectly imporeted

  SELECT *
  FROM invoices

    SELECT *
  FROM products

  SELECT *
  FROM invoicedetails

---Drop the stagingtable
DROP TABLE stagingtable;


