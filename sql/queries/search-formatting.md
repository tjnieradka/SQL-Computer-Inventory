## Logical Order of SQL Query Processing

Although SQL queries are written top-to-bottom, they are processed in a different logical order by the database engine:

1. FROM
2. JOIN
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. ORDER BY

NOTES:
- Column aliases cannot be used in WHERE
- Aggregation happens before SELECT output
- Filtering aggregated data requires HAVING
