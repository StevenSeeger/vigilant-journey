with daily_amounts AS (
  SELECT
      DATE(transaction_time) as date_day,
      sum(transaction_amount) as transaction_amount
  FROM transactions
  GROUP BY date_day
 )
 SELECT
 	date_day,
    ROUND(AVG(transaction_amount) OVER (ORDER BY date_day ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)::NUMERIC, 2) AS running_average
FROM daily_amounts
ORDER BY date_day DESC