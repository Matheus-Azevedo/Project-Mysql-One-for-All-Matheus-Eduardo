SELECT 
    M.music_name AS cancao,
    COUNT(H.music_id) AS reproducoes
FROM
    SpotifyClone.music AS M
        INNER JOIN
    SpotifyClone.historic AS H ON M.music_id = H.music_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;