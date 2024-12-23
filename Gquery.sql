SELECT
  FORMAT_DATE('%Y-%W', refresh_date) AS Week,
  term AS Top_Term,
  rank,
  COUNT(*) AS Occurrences
FROM `bigquery-public-data.google_trends.international_top_terms`
WHERE
  rank = 3
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
  AND country_name = 'United Kingdom'
GROUP BY Week, Top_Term, rank
ORDER BY Week DESC, rank ASC;