SELECT 
    COUNT(H.music_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.user AS U
        INNER JOIN
    SpotifyClone.historic AS H ON U.user_id = H.user_id
WHERE U.user_name = 'Barbara Liskov';