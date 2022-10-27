SELECT 
   M.music_name AS nome,
   COUNT(H.user_id)  AS reproducoes
FROM
    SpotifyClone.music AS M
        INNER JOIN
    SpotifyClone.historic AS H ON M.music_id = H.music_id
		INNER JOIN
    SpotifyClone.user AS U ON U.user_id = H.user_id
WHERE U.plan_id = 1 OR U.plan_id = 4
GROUP BY nome
ORDER BY nome;