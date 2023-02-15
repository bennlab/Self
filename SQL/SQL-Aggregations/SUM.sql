"""Find the total dollar amount of sales using the total_amt_usd in the orders table."""
SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

"""Find the total amount for each individual order that was spent on standard and gloss paper in the orders table. 
This should give a dollar amount for each order in the table."""
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

"""Though the price/standard_qty paper varies from one order to the next. 
I would like this ratio across all of the sales made in the orders table."""
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

