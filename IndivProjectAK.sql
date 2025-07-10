use TargetTable; 

##2
SELECT MIN(DATE(InvoiceDate)) AS Start_Date, MAX(DATE(InvoiceDate)) AS End_Date
FROM Invoice;


##3 
SELECT i.InvoiceDate, 
       i.InvoiceNo, 
       id.DetailNo, 
       id.StockCode
FROM Invoice i
JOIN Invoice_Detail id ON i.InvoiceNo = id.InvoiceNo
LEFT JOIN Product p ON id.StockCode = p.StockCode
WHERE p.Description IS NULL OR p.Description = ''
ORDER BY i.InvoiceDate DESC;

##4
SELECT
    c.CountryCode,
    c.Country,
    COUNT(DISTINCT CASE WHEN i.CustomerID IS NOT NULL THEN i.CustomerID END) AS Unique_Customers,
    COUNT(DISTINCT CASE WHEN i.CustomerID IS NOT NULL THEN id.InvoiceNo END) AS Known_Customer_Purchases,
    COUNT(id.InvoiceNo) AS Total_Purchases,
    IF(SUM(CASE WHEN i.CustomerID IS NULL THEN 1 ELSE 0 END) > 0, '*', '') AS Null_CustomerIDs
FROM
    Country c
INNER JOIN
    Invoice i ON c.CountryCode = i.Country
INNER JOIN
    Invoice_Detail id ON i.InvoiceNo = id.InvoiceNo
GROUP BY
    c.CountryCode, c.Country
ORDER BY
    c.CountryCode;

##5
SELECT
    p.stockCode,
    p.description,
    id.comment,
    COUNT(*) AS Num_Entries,
    SUM(id.quantity) AS Total_Quantity,
    SUM(id.quantity * id.UnitPrice) AS Total_Price,
    AVG(id.quantity) AS Avg_Quantity,
    AVG(id.UnitPrice) AS Avg_UnitPrice
FROM
    product p
JOIN
    invoice_detail id ON p.stockCode = id.stockCode
WHERE
    id.comment IS NOT NULL
    AND id.quantity < 1
GROUP BY
    p.stockCode,
    p.description,
    id.comment
ORDER BY
    Avg_UnitPrice;

##6 
SELECT
    ROUND(SUM(id.quantity * id.UnitPrice), 2) AS Total,
    ROUND(AVG(id.quantity * id.UnitPrice), 2) AS Average
FROM
    invoice_detail id
JOIN
    invoice i ON id.InvoiceNo = i.InvoiceNo
WHERE
    id.quantity > 0
    AND i.Country = 'Ireland';

##7
SELECT
    id.StockCode,
    p.Description,
    SUM(id.Quantity * id.UnitPrice) AS Total_Revenue
FROM
    invoice_detail id
JOIN
    product p ON id.StockCode = p.StockCode
WHERE
    id.StockCode REGEXP '^[A-Z]' 
    AND id.StockCode NOT LIKE 'gif%'
    AND id.StockCode NOT LIKE 'PAD%'
    AND id.StockCode NOT LIKE 'DCG%'
    AND id.StockCode NOT LIKE 'C2%'
GROUP BY
    id.StockCode,
    p.Description
ORDER BY
    id.StockCode ASC;

##8 
SELECT
    i.InvoiceDate,
    id.InvoiceNo,
    id.DetailNo,
    id.StockCode,
    p.Description,
    id.UnitPrice,
    id.Quantity,
    (SELECT SUM(Quantity * UnitPrice) FROM Invoice_Detail WHERE InvoiceNo = id.InvoiceNo) AS Total_Order
FROM
    Invoice_Detail id
JOIN
    Invoice i ON id.InvoiceNo = i.InvoiceNo
JOIN
    Product p ON id.StockCode = p.StockCode
WHERE
    id.StockCode = '15056BL'
    AND DATE(i.InvoiceDate) <= '2011-01-31'
ORDER BY
    id.InvoiceNo, id.DetailNo;

##9
SELECT
    Year,
    Month,
    StockCode,
    Product_Description,
    Total_Revenue
FROM (
    SELECT
        YEAR(i.InvoiceDate) AS Year,
        MONTH(i.InvoiceDate) AS Month,
        p.StockCode,
        p.Description AS Product_Description,
        SUM(id.Quantity * id.UnitPrice) AS Total_Revenue,
        ROW_NUMBER() OVER (PARTITION BY YEAR(i.InvoiceDate), MONTH(i.InvoiceDate) ORDER BY SUM(id.Quantity * id.UnitPrice) DESC) AS Max_Rank,
        ROW_NUMBER() OVER (PARTITION BY YEAR(i.InvoiceDate), MONTH(i.InvoiceDate) ORDER BY SUM(id.Quantity * id.UnitPrice) ASC) AS Min_Rank
    FROM
        Invoice_Detail id
    JOIN
        Invoice i ON id.InvoiceNo = i.InvoiceNo
    JOIN
        Product p ON id.StockCode = p.StockCode
    WHERE
        i.InvoiceDate >= '2010-12-01' AND i.InvoiceDate <= '2011-11-30'
        AND id.Quantity * id.UnitPrice > 0
    GROUP BY
        YEAR(i.InvoiceDate), MONTH(i.InvoiceDate), p.StockCode, p.Description
) AS RevenueSummary
WHERE
    Max_Rank = 1 OR Min_Rank = 1
ORDER BY
    Year ASC, Month ASC, Total_Revenue DESC;




