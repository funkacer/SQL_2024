-- https://towardsdatascience.com/how-to-derive-summary-statistics-using-postgresql-742f3cdc0f44

-- Frequency and relative frequency
SELECT 
 type,
 COUNT(type) AS frequency,
 ROUND(COUNT(type)::NUMERIC / SUM(COUNT(type)) OVER(), 4) AS relative_frequency, SUM(COUNT(type)) OVER(), COUNT(type) OVER()
    FROM public.bill
     GROUP BY type
      ORDER BY frequency DESC;

-- Cardinality
SELECT 
 COUNT(DISTINCT type) AS cardinality
  FROM public.bill;

-- Mode
SELECT 
 MODE() WITHIN GROUP (ORDER BY type) AS mode
  FROM public.bill;