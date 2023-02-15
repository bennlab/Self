"""Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd."""
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;

"""Write a query that displays the order ID, account ID, and total dollar amount for all the orders, 
sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order)."""
SELECT id,account_id, total_amt_usd
FROM orders
ORDER BY account_id ASC, total_amt_usd DESC;

"""Determine the number of times a particular channel was used in the web_events table for each sales rep. 
Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. 
Order your table with the highest number of occurrences first."""
SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;


