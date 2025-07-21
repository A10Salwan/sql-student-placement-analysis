
SELECT 
  COUNT(*) AS Low_CGPA_Placed
  SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) AS Placed,
  ROUND(100.0 * SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Placement_Rate
FROM placement_data
WHERE CGPA < 6 AND Placement = '''Yes''';