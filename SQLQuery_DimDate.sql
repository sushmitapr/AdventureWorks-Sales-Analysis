/****** Data Cleaning Dim Date Table ******/

SELECT [DateKey]
      ,[FullDateAlternateKey] as Date
      --[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek] as Day
      --[SpanishDayNameOfWeek]
      --[FrenchDayNameOfWeek]
      --[DayNumberOfMonth]
      --[DayNumberOfYear]
      ,[WeekNumberOfYear] as Week_Number
      ,[EnglishMonthName] as MonthName, Left(EnglishMonthName,3) as Month
      --[SpanishMonthName]
      --[FrenchMonthName]
      ,[MonthNumberOfYear] as Month_Number
      ,[CalendarQuarter] as Qurater
      ,[CalendarYear] as Year
      --[CalendarSemester]
      --[FiscalQuarter]
      --[FiscalYear]
      --[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  where CalendarYear>=2019
  order by 9 desc
