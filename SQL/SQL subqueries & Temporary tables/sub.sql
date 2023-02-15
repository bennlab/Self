'''
Use the test environment below to find the number of events that occur for each day for each channel, 
then find the average number of events for each channel.
Since you broke out by day earlier, this is giving you an average per day.'''
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
             channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;


'''
Use DATE_TRUNC to pull month level information about the first order ever placed in the orders table, 
then use the result of the previous query to find only the orders that took place in  the same month and
then pull the average for each type of paper qty in this month.'''
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);
'''The total amount spent on all orders on the first month that any order was placed 
in the orders table (in terms of usd).'''
SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);


