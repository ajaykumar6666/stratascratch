SELECT company, profits
FROM (SELECT 
        company,
        profits,
        rank() OVER(ORDER BY profits DESC) AS ranking
        FROM forbes_global_2010_2014) AS a
    WHERE a.ranking<4
    ORDER BY a.profits DESC