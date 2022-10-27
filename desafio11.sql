SELECT 
    music_name AS nome_musica,
    CASE
        WHEN music_name LIKE '%Bard%' THEN REPLACE(music_name, 'Bard', 'QA')
        WHEN
            music_name LIKE '%Amar%'
        THEN
            REPLACE(music_name,
                'Amar',
                'Code Review')
        WHEN
            music_name LIKE '%Pais%'
        THEN
            REPLACE(music_name,
                'Pais',
                'Pull Requests')
        WHEN music_name LIKE '%SOUL%' THEN REPLACE(music_name, 'SOUL', 'CODE')
        WHEN
            music_name LIKE '%SUPERSTAR%'
        THEN
            REPLACE(music_name,
                'SUPERSTAR',
                'SUPERDEV')
        ELSE NULL
    END AS novo_nome
FROM
    SpotifyClone.music
WHERE
    music_name LIKE '%Bard%'
        OR  music_name LIKE '%Amar%'
        OR  music_name LIKE '%Pais%'
        OR  music_name LIKE '%SOUL%'
        OR  music_name LIKE '%SUPERSTAR%'
ORDER BY  music_name DESC;