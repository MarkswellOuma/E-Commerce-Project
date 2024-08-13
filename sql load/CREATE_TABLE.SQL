/*
Explanation:
Invoices: Contains invoice-level information such as invoice number, date, customer ID, and country.
Products: Contains product details such as stock code, description, and unit price.
InvoiceDetails: Connects invoices and products, containing the quantity of each product per invoice.
*/
---create the staging table
CREATE TABLE StagingTable (
    InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice DECIMAL(10, 2),
    CustomerID INT,
    Country VARCHAR(50)
);
 ---create the main tables


-----Invoices Table
CREATE TABLE Invoices (
    InvoiceNo VARCHAR(10) PRIMARY KEY,  -- Unique identifier for each invoice
    InvoiceDate TIMESTAMP,              -- Date and time of the invoice
    CustomerID INT,                     -- Identifier for the customer
    Country VARCHAR(50) 
);
    ----Products Table
    CREATE TABLE Products (
    StockCode VARCHAR(20),              -- Product code (not a primary key)
    Description VARCHAR(255),           -- Description of the product
    UnitPrice DECIMAL(10, 2)            -- Price per unit of the product
);

---InvoceDetails
CREATE TABLE InvoiceDetails (
    InvoiceNo VARCHAR(10),              -- Foreign key from the Invoices table
    StockCode VARCHAR(20),              -- Product code (not a foreign key in this case)
    Quantity INT,                       -- Quantity of the product in the invoice
    FOREIGN KEY (InvoiceNo) REFERENCES Invoices(InvoiceNo)  -- Ensures InvoiceNo exists in Invoices
);

---Indixes for Optimization
CREATE INDEX idx_customer_country ON Invoices(CustomerID, Country);
CREATE INDEX idx_product_stockcode ON Products(StockCode);
CREATE INDEX idx_invoice_details_stockcode ON InvoiceDetails(StockCode);
