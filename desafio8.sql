SELECT 
    A.artist_name AS artista,
    AL.album_name AS album
FROM
    SpotifyClone.artist AS A
        INNER JOIN
    SpotifyClone.album AS AL ON A.artist_id = AL.artist_id
WHERE A.artist_name = 'Elis Regina'
GROUP BY artista, album
ORDER BY album;