-- 14. Self join

-- Test
SELECT P.EnglishProductName as 'Product', 
	PS.EnglishProductSubcategoryName as 'Subcategory'
FROM DimProduct P
LEFT JOIN DimProductSubCategory PS
ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey
WHERE EnglishProductSubcategoryName IS NOT NULL

-- 14.1
SELECT  P.EnglishProductName as 'Product', 
	P.ProductKey, PS.ProductSubcategoryKey
FROM DimProduct P
LEFT JOIN DimProductSubCategory PS
ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey

-- 14.2 | Inner Join
SELECT P.EnglishProductName as 'Product', 
	PS.EnglishProductSubcategoryName as 'Subcategory'
FROM DimProduct P
INNER JOIN DimProductSubCategory PS
ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey

-- 14.3 | Cross Join
SELECT P.EnglishProductName as 'Product', 
	PS.EnglishProductSubcategoryName as 'Subcategory'
FROM DimProduct P
CROSS JOIN DimProductSubcategory PS
