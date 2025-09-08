-- 15. NULL v‰‰rtuse asendamine erinevat moodi

-- 15.1 | ISNULL()
SELECT P.EnglishProductName as 'Product', 
	ISNULL(PS.EnglishProductSubcategoryName, 'None') as 'Subcategory'
FROM DimProduct P
LEFT JOIN DimProductSubCategory PS
ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey

-- 15.2 | CASE
SELECT P.EnglishProductName as 'Product', 
	CASE WHEN PS.EnglishProductSubcategoryName IS NULL THEN 'None'
	ELSE PS.EnglishProductSubcategoryName END as 'Subcategory'
FROM DimProduct P
LEFT JOIN DimProductSubCategory PS
ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey

-- 15.3 | COALESCE()
SELECT P.EnglishProductName as 'Product', 
	COALESCE(PS.EnglishProductSubcategoryName, 'None') as 'Subcategory'
FROM DimProduct P
LEFT JOIN DimProductSubCategory PS
ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey