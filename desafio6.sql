SELECT 
    MIN(P.plan_value) AS faturamento_minimo,
    MAX(P.plan_value) AS faturamento_maximo,
    ROUND(AVG(P.plan_value), 2) AS faturamento_medio,
    SUM(P.plan_value) AS faturamento_total
FROM
    SpotifyClone.plan AS P
        INNER JOIN
    SpotifyClone.user AS U ON P.plan_id = U.plan_id;