/****** Cleaning Dim Customer table  ******/
SELECT ct.[CustomerKey]
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      ,ct.[FirstName]
      --,[MiddleName]
      ,ct.[LastName]
	  ,ct.FirstName+' '+LastName as FullName
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
      ,case ct.[Gender] when 'M' then 'Male' when 'F' then 'Female'
	  end as Gender
	  /*
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[SpanishEducation]
      ,[FrenchEducation]
      ,[EnglishOccupation]
      ,[SpanishOccupation]
      ,[FrenchOccupation]
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]*/
      ,ct.[DateFirstPurchase]
      --,[CommuteDistance]
	  ,geo.City
  FROM
  [AdventureWorksDW2019].[dbo].[DimCustomer] as CT
  LEFT JOIN DimGeography as GEO on geo.GeographyKey= ct.GeographyKey -- Joined customer city from geography table
  ORDER BY
  ct.CustomerKey ASC

