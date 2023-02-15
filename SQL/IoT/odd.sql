'''Q18. Write a query to calculate the even and odd records from a table.
To retrieve the even records from a table, you have to use the MOD() function as follows:
'''
SELECT EmpID 
FROM (
    SELECT 
    rowno, 
    EmpID 
    from EmployeeInfo
    ) 
    WHERE MOD(rowno,2)=0;


 '''
Determine the total views by counting product_views and the number of unique 
visitors by counting fullVisitorID.
'''   
SELECT
  COUNT(*) AS product_views,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM `data-to-insights.ecommerce.all_sessions`;

'''
refine the query to no longer double-count product views for visitors who have 
viewed a product many times. Each distinct product view should only count once 
per visitor:
'''
WITH unique_product_views_by_person AS (
-- find each unique product viewed by each visitor
SELECT
 fullVisitorId,
 (v2ProductName) AS ProductName
FROM `data-to-insights.ecommerce.all_sessions`
WHERE type = 'PAGE'
GROUP BY fullVisitorId, v2ProductName )
-- aggregate the top viewed products and sort them
SELECT
  COUNT(*) AS unique_view_count,
  ProductName
FROM unique_product_views_by_person
GROUP BY ProductName
ORDER BY unique_view_count DESC
LIMIT 5
