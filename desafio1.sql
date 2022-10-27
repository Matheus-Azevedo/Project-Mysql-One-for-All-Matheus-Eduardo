-- Começando o desafio 1
DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
      plan_id INTEGER auto_increment PRIMARY KEY NOT NULL,
      plan_name VARCHAR(50) NOT NULL,
      plan_value DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_id INTEGER auto_increment PRIMARY KEY NOT NULL,
      user_name VARCHAR(100) NOT NULL,
      user_age INT NOT NULL,
      plan_id INTEGER,
      FOREIGN KEY (plan_id) REFERENCES plan (plan_id),
      user_date_signature DATE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
      artist_id INTEGER auto_increment PRIMARY KEY NOT NULL,
      artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INTEGER auto_increment PRIMARY KEY NOT NULL,
      artist_id INTEGER,
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
      album_name VARCHAR(100) NOT NULL,
      album_year INT NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.music(
      music_id INTEGER auto_increment PRIMARY KEY NOT NULL,
      artist_id INTEGER,
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
      album_id INTEGER,
      FOREIGN KEY (album_id) REFERENCES album (album_id),
      music_name VARCHAR(100) NOT NULL,
      music_duration INT NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historic(
      music_id INTEGER NOT NULL,
      FOREIGN KEY (music_id) REFERENCES music (music_id),
      historic_date_reproduction DATETIME NOT NULL,
      user_id INTEGER NOT NULL,
      FOREIGN KEY (user_id) REFERENCES user (user_id),
      PRIMARY KEY (user_id, music_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.following(
      user_id INTEGER NOT NULL,
      FOREIGN KEY (user_id) REFERENCES user (user_id),
      artist_id INTEGER NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
      PRIMARY KEY (user_id, artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plan (plan_name, plan_value)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal',	6.99);

    INSERT INTO SpotifyClone.user (user_name, user_age, plan_id, user_date_signature)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),														
    ('Robert Cecil Martin' ,58	,1	,'2017-01-06'),																						
    ('Ada Lovelace'	,37, 2,'2017-12-30'),																						
    ('Martin Fowler', 46,	2,	'2017-01-17'),																						
    ('Sandi Metz',	58,	2,	'2018-04-29'),																						
    ('Paulo Freire',	19,	3,	'2018-02-14'),																						
    ('Bell Hooks',	26,	3,	'2018-01-05'),																						
    ('Christopher Alexander',	85,	4,	'2019-06-05'),																						
    ('Judith Butler',	45,	4,	'2020-05-13'),																						
    ('Jorge Amado',	58,	4,	'2017-02-17');

    INSERT INTO SpotifyClone.artist (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

    INSERT INTO SpotifyClone.album (artist_id, album_name, album_year)
  VALUES
    (1,	'Renaissance', 2022),
    (2,	'Jazz',	1978),
    (2,	'Hot Space', 1982),
    (3,	'Falso Brilhante', 1998),
    (3,	'Vento de Maio', 2001),
    (4,	'QVVJFA?', 2003),
    (5,	'Somewhere Far Beyond', 2007),
    (6,	'I Put A Spell On You', 2012);

    INSERT INTO SpotifyClone.music (artist_id, album_id, music_name, music_duration)
  VALUES
    (1,	1,	"BREAK MY SOUL",	279),
    (1,	1,	"VIRGO’S GROOVE",	369),
    (1,	1,	"ALIEN SUPERSTAR",	116),
    (2,	2,	"Don’t Stop Me Now",	203),
    (2,	3,	"Under Pressure",	152),
    (3,	4,	"Como Nossos Pais",	105),
    (3,	5,	"O Medo de Amar é o Medo de Ser Livre",	207),
    (4,	6,	"Samba em Paris",	267),
    (5,	7,	"The Bard’s Song",	244),
    (6,	8,	"Feeling Good",	100);
    INSERT INTO SpotifyClone.historic (music_id, historic_date_reproduction, user_id)
  VALUES
    (8,	"2022-02-28 10:45:55",	1),
    (2,	"2020-05-02 05:30:35",	1),
    (10,	"2020-03-06 11:22:33",	1),
    (10,	"2022-08-05 08:05:17",	2),
    (7,	"2020-01-02 07:40:33",	2),
    (10,	"2020-11-13 16:55:13",	3),
    (2,	"2020-12-05 18:38:30",	3),
    (8,	"2021-08-15 17:10:10",	4),
    (8,	"2022-01-09 01:44:33",	5),
    (5,	"2020-08-06 15:23:43",	5),
    (7,	"2017-01-24 00:31:17",	6),
    (1,	"2017-10-12 12:35:20",	6),
    (4,	"2011-12-15 22:30:49",	7),
    (4,	"2012-03-17 14:56:41",	8),
    (9,	"2022-02-24 21:14:22",	9),
    (3,	"2015-12-13 08:30:22",	10);

    INSERT INTO SpotifyClone.following (user_id, artist_id)
  VALUES
    (1,	1),
    (1,	2),
    (1,	3),
    (2,	1),
    (2,	3),
    (3,	2),
    (4,	4),
    (5,	5),
    (5,	6),
    (6,	1),
    (6,	6),
    (7,	6),
    (9,	3),
    (10, 2);