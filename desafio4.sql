SELECT 
    user_name AS usuario,
	IF(YEAR(MAX(H.historic_date_reproduction)) >= 2021,
        'Usuário ativo',
        'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.user AS U
        INNER JOIN
    SpotifyClone.historic AS H ON U.user_id = H.user_id
GROUP BY user_name
ORDER BY user_name;