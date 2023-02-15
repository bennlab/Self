            """ LIKE [Only pulls rows where column has '' within the text]   """
"""All the companies whose names start with 'C'."""
SELECT *
FROM accounts
WHERE name LIKE 'C%';

""" All companies whose names contain the string 'one' somewhere in the name. """
SELECT *
FROM accounts
WHERE name LIKE '%one%';

""" All companies whose names end with 's'."""
SELECT *
FROM accounts
WHERE name LIKE '%s';



        """ IN [A filter for only rows with column of '' or '']  """
"""Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom."""
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart','Target','Nordstrom');


"""Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords."""
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');


        """ NOT[NOT is frequently used with LIKE and IN]"""
"""All the companies whose names do not start with 'C'."""
SELECT *
FROM accounts
WHERE name  NOT LIKE 'C%';

"""Use the web_events table to find all information NOT regarding individuals who were contacted via the channel of organic or adwords."""
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');



        """ AND and BETWEEN [Filter rows where two or more conditions must be true]"""
""" Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0."""
SELECT *
FROM orders
WHERE standard_qty >1000 AND poster_qty = 0 AND gloss_qty = 0;

"""Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'."""
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

"""When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not?
 Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data
  for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included 
  the begin and end values or not."""
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;
"""yes it does include endpoints"""

"""Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels,
 and started their account at any point in 2016, sorted from newest to oldest."""
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;
"""You will notice that using BETWEEN is tricky for dates! While BETWEEN is generally inclusive of endpoints, 
it assumes the time is at 00:00:00 (i.e. midnight) for dates. This is the reason why we set the right-side 
endpoint of the period at '2017-01-01'."""


                """  OR   [Filter rows where at least one condition must be true]"""
"""Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table."""
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty >4000;

"""Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000."""
SELECT *
FROM orders
WHERE standard_qty = 0 AND (poster_qty >1000 OR gloss_qty >1000)

"""Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'."""
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');
