-- https://towardsdatascience.com/how-to-derive-summary-statistics-using-postgresql-742f3cdc0f44

WITH RECURSIVE
summary_stats AS
(
 SELECT 
  ROUND(AVG(amount), 2) AS mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY amount) AS median,
  MIN(amount) AS min,
  MAX(amount) AS max,
  MAX(amount) - MIN(amount) AS range,
  ROUND(STDDEV(amount), 2) AS standard_deviation,
  ROUND(VARIANCE(amount), 2) AS variance,
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY amount) AS q1,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY amount) AS q3
   FROM public.bill
),
row_summary_stats AS
(
SELECT 
 1 AS sno, 
 'mean' AS statistic, 
 mean AS value 
  FROM summary_stats
UNION
SELECT 
 2, 
 'median', 
 median 
  FROM summary_stats
UNION
SELECT 
 3, 
 'minimum', 
 min 
  FROM summary_stats
UNION
SELECT 
 4, 
 'maximum', 
 max 
  FROM summary_stats
UNION
SELECT 
 5, 
 'range', 
 range 
  FROM summary_stats
UNION
SELECT 
 6, 
 'standard deviation', 
 standard_deviation 
  FROM summary_stats
UNION
SELECT 
 7, 
 'variance', 
 variance 
  FROM summary_stats
UNION
SELECT 
 9, 
 'Q1', 
 q1 
  FROM summary_stats
UNION
SELECT 
 10, 
 'Q3', 
 q3 
  FROM summary_stats
UNION
SELECT 
 11, 
 'IQR', 
 (q3 - q1) 
  FROM summary_stats
UNION
SELECT 
 12, 
 'skewness', 
 ROUND(3 * (mean - median)::NUMERIC / standard_deviation, 2) AS skewness 
  FROM summary_stats
)
SELECT * 
 FROM row_summary_stats
  ORDER BY sno;