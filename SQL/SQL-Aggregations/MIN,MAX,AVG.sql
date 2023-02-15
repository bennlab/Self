"""When was the earliest order ever placed?"""
SELECT MIN(occurred_at) 
FROM orders;

"""Try performing the same query as in question 1 without using an aggregation function.
"""
SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1;

"""When did the most recent (latest) web_event occur?"""
SELECT MAX(occurred_at) 
FROM web_events;

"""Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order."""
SELECT
a.name acc_name,
o.occurred_at _date
FROM accounts a
JOIN orders o
ON o.account_id = a.id
ORDER BY occurred_at
LIMIT 1;


"""Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each
 paper type purchased per order. Your final answer should have 6 values - 
 one for each paper type for the average number of sales, as well as the average amount."""
 SELECT 
AVG(gloss_qty) as gloss_mean,
AVG(poster_qty) as poster_mean,
AVG(standard_qty) as standard_mean,
SUM(gloss_amt_usd)/COUNT(gloss_amt_usd) as mean_gloss_amt,
SUM(poster_amt_usd)/COUNT(poster_amt_usd) as mean_poster_amt,
SUM(standard_amt_usd)/COUNT(standard_amt_usd) as mean_standard_amt
FROM orders;
"""Via the video, you might be interested in how to calculate the MEDIAN.
 Though this is more advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent on all orders?
  Note, this is more advanced than the topics we have covered thus far to build a general solution, but we can hard code a solution in the following way."""
  SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;
        """Since there are 6912 orders - we want the average of the 3457 and 3456 order amounts when ordered. 
        This is the average of 2483.16 and 2482.55. This gives the median of 2482.855. This obviously isn't an ideal way to compute.
         If we obtain new orders, we would have to change the limit. SQL didn't even calculate the median for us. The above used a SUBQUERY, 
         but you could use any method to find the two necessary values, and then you just need the average of them."""


