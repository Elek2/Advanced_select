INSERT INTO genres (name) VALUES
('rock'),
('rap'),
('indi rock'),
('pop'),
('disco'),
('jazz'),
('heavy metal')
ON CONFLICT DO NOTHING;

INSERT INTO artists (id, name) VALUES
(1, 'Звери'),
(2, 'Metallica'),
(3,'МакSим'),
(4,'Ace of Base'),
(5,'Проба Пера'),
(6,'Oxxxymiron'),
(7,'Кино'),
(8,'Ария'),
(9,'Френк Синатра'),
(10, 'Animal ДжаZ')
ON CONFLICT DO NOTHING;

INSERT INTO albums (name, year) VALUES
('Один на один', '2014'),
('Районы-кварталы', '2004'),
('Ride The Lightning', '1984'),
('Master Of Puppets', '1986'),
('МОЙ РАЙ', '2007'),
('Другая реальность', '2013'),
('Happy Nation', '1992'),
('Том первый', '2018'),
('Горгород', '2015'),
('Вечный жид', '2011'),
('Последний герой', '1989'),
('Герой асфальта', '1987'),
('The World We Knew', '1966'),
('У тебя в голове', '2019'),
('Живи', '2012')
ON CONFLICT DO NOTHING;

INSERT INTO tracks (name, lenght, album_id) VALUES
('Клятвы', 234, 1),
('Облака из папирос', 210, 1),
('Районы-кварталы', 204, 2),
('Напитки покрепче', 232, 2),
('Fade to black', 357, 3),
('Master Of Puppets', 515, 4),
('МОЙ РАЙ', 215, 5),
('Не отдам', 187, 5),
('Дождь', 210, 6),
('All that she wants', 211, 7),
('Ветер', 306, 8),
('Тишина', 214, 8),
('Дорога домой', 265, 8),
('Переплетено', 291, 9),
('До сих пор МС', 214, 10),
('Перемен', 295, 11),
('Группа крови', 239, 11),
('Герой асфальта', 313, 12),
('Улица роз', 356, 12),
('Крещение огнем', 381, 13),
('The World We Knew', 170, 14),
('Drinking Again', 193, 14),
('Котенок', 194, 68),
('Мотылек', 193, 68),
('Живи', 259, 83)
ON CONFLICT (name) DO UPDATE SET
name = EXCLUDED.name,
lenght =  EXCLUDED.lenght,
album_id = EXCLUDED.album_id;

INSERT INTO collections (name, year) VALUES
('Best rap songs', 2014),
('Best 20 century', 2015),
('Лучшие поп песни', 2010),
('60s', 2000),
('Русская классика', 2015),
('Best of Metallica', 2015),
('Современные хиты', 2001),
('Gold collection', 2020)
ON CONFLICT DO NOTHING;

INSERT INTO artist_album (artist_id, album_id) VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,7),
(5,8),
(6,9),
(6,10),
(7,11),
(8,12),
(8,13),
(9,14),
(1, 68),
(3, 83),
(10, 83)
ON CONFLICT (artist_id, album_id) DO UPDATE SET
album_id = EXCLUDED.album_id,
artist_id  = EXCLUDED.artist_id;

INSERT INTO track_collection VALUES
(1, 3),
(2, 7),
(3, 3),
(4, 7),
(5, 6),
(6, 6),
(7, 3),
(8, 3),
(10, 4),
(10, 8),
(11, 7),
(12, 7),
(12, 8),
(14, 8),
(16, 2),
(17, 2),
(18, 2),
(19, 5),
(20, 4),
(21, 8),
(1, 7),
(3, 7),
(4, 5),
(6, 2),
(7, 8),
(16, 5),
(17, 8),
(20, 8),
(21, 4),
(14, 1),
(15, 1)
ON CONFLICT DO NOTHING;

INSERT INTO genre_artist  VALUES
(1, 1),
(1, 5),
(1, 7),
(1, 8),
(2, 6),
(3, 5),
(4, 1),
(4, 3),
(5, 3),
(5, 4),
(6, 9),
(7, 2),
(7, 8),
(1, 10),
(3, 10)
ON CONFLICT DO NOTHING;