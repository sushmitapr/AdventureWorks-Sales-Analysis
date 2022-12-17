/****** Cleaning Product Table  ******/

SELECT pd.[ProductKey]
      ,pd.[ProductAlternateKey]
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,pd.[EnglishProductName] as ProductName
	  ,psc.EnglishProductSubcategoryName as ProductSubCategory    -- joined from subcategory table
	  ,pc.EnglishProductCategoryName as ProductCategory           --joined from category table
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,pd.[Color] as ProductColor
      --,[SafetyStockLevel]
     --,[ReorderPoint]
      --,[ListPrice]
      ,pd.[Size] as ProductSize
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,pd.[ProductLine]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,pd.[ModelName]
      --,[LargePhoto]
      ,pd.[EnglishDescription] as ProductDescription
	  /*,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]*/
      ,isnull (pd.Status,'Outdated') as ProductStatus
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] as PD
  LEFT JOIN DimProductSubcategory as PSC
  ON psc.ProductSubcategoryKey=pd.ProductSubcategoryKey
  LEFT JOIN DimProductCategory as PC
  ON pc.ProductcategoryKey=psc.ProductCategoryKey
  ORDER BY
  PD.ProductKey ASC