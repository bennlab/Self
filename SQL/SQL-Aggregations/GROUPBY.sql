"""Find the total sales in usd for each account. You should include two columns - 
the total sales for each company's orders in usd and the company name."""
SELECT
a.name company,
SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY name;

"""Find the total number of times each type of channel from the web_events was used.
 Your final table should have two columns - the channel and the number of times the channel was used."""
 SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel;


"""What was the smallest order placed by each account in terms of total usd. 
Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest."""
SELECT 
MIN(o.total_amt_usd) total_usd,
a.name acc_name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY name
ORDER BY total_usd ASC;


"""For each account, determine the average amount of each type of paper they purchased across their orders.
Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
"""
SELECT a.name, AVG(o.standard_qty) avg_stand, AVG(o.gloss_qty) avg_gloss, AVG(o.poster_qty) avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

"""Determine the number of times a particular channel was used in the web_events table for each region. 
Your final table should have three columns - the region name, the channel, and the number of occurrences. 
Order your table with the highest number of occurrences first."""
SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;

