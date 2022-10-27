SELECT 
    COUNT(DISTINCT M.music_id) AS cancoes,
    COUNT(DISTINCT AR.artist_id) AS artistas,
    COUNT(DISTINCT AL.album_id) AS albuns
FROM
    SpotifyClone.music AS M
      INNER JOIN
    SpotifyClone.artist AS AR ON M.artist_id = AR.artist_id
		  INNER JOIN
    SpotifyClone.album AS AL ON M.album_id = AL.album_id;