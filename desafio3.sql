SELECT 
    user_name AS usuario,
    COUNT(H.music_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(M.music_duration) / 60, 2) AS total_minutos
FROM
    SpotifyClone.user AS U
        INNER JOIN
    SpotifyClone.historic AS H ON U.user_id = H.user_id
        INNER JOIN
    SpotifyClone.music AS M ON H.music_id = M.music_id
GROUP BY user_name
ORDER BY user_name;