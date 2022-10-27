SELECT 
    A.artist_name AS artista,
    AL.album_name AS album,
    COUNT(F.user_id) AS seguidores
FROM
    SpotifyClone.artist AS A
        INNER JOIN
    SpotifyClone.album AS AL ON A.artist_id = AL.artist_id
        INNER JOIN
    SpotifyClone.following AS F ON A.artist_id = F.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC , artista ASC, album ASC;