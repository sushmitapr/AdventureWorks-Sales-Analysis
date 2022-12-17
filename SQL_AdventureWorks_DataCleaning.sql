USE AdventureWorksDW2019


/****** Data Cleaning Dim Date Table ******/

SELECT [datekey],
       [fulldatealternatekey]    AS Date,
       [englishdaynameofweek]    AS Day,
       [weeknumberofyear]        AS Week_Number,
       [englishmonthname]        AS MonthName,
       LEFT(englishmonthname, 3) AS Month,
       [monthnumberofyear]       AS Month_Number,
       [calendarquarter]         AS Qurater,
       [calendaryear]            AS Year
FROM   [AdventureWorksDW2019].[dbo].[dimdate]
WHERE  calendaryear >= 2019
ORDER  BY year DESC


/****** Cleaning Dim Customer table  ******/

SELECT ct.[customerkey],
       ct.[firstname],
       ct.[lastname],
       ct.firstname + ' ' + lastname AS FullName,
       CASE ct.[gender]
         WHEN 'M' THEN 'Male'
         WHEN 'F' THEN 'Female'
       END AS Gender,
       ct.[datefirstpurchase],
       geo.city
FROM   [AdventureWorksDW2019].[dbo].[dimcustomer] AS CT
       LEFT JOIN [AdventureWorksDW2019].[dbo].dimgeography AS GEO
              ON geo.geographykey = ct.geographykey                                 -- Joined customer city from geography table
ORDER  BY ct.customerkey ASC



/****** Cleaning Product Table  ******/


SELECT pd.[productkey],
       pd.[productalternatekey],
       pd.[englishproductname]           AS ProductName,
       psc.englishproductsubcategoryname AS ProductSubCategory,          -- joined from subcategory table
       pc.englishproductcategoryname     AS ProductCategory,             --joined from category table
       pd.[color]                        AS ProductColor,
       pd.[size]                         AS ProductSize,
       pd.[productline],
       pd.[modelname],
       pd.[englishdescription]           AS ProductDescription,
       ISNULL (pd.status, 'Outdated')    AS ProductStatus
FROM   [AdventureWorksDW2019].[dbo].[dimproduct] AS PD
       LEFT JOIN dimproductsubcategory AS PSC
              ON psc.productsubcategorykey = pd.productsubcategorykey
       LEFT JOIN dimproductcategory AS PC
              ON pc.productcategorykey = psc.productcategorykey
ORDER  BY PD.productkey ASC



/****** Cleaning Internet Sales Table  ******/


SELECT [productkey],
       [orderdatekey],
       [duedatekey],
       [shipdatekey],
       [customerkey],
       [salesordernumber],
       [salesamount]
FROM   [AdventureWorksDW2019].[dbo].[factinternetsales]
WHERE  LEFT (orderdatekey, 4) >= Year(Getdate()) - 2                      --extracts only last 2 years of date from the present date
ORDER  BY orderdatekey ASC 