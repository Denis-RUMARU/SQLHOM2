-- Вставка данных в таблицу исполнителей
INSERT INTO Artists (Name) VALUES 
('Michael Jackson'),
('Madonna'),
('The Beatles'),
('Queen'),
('Louis Armstrong'),
('Billie Holiday'),
('Adele'),
('Elton John');

-- Вставка данных в таблицу жанров
INSERT INTO Genres (Name) VALUES 
('Rock'),
('Pop'),
('Jazz'),
('Classical');

-- Вставка данных в таблицу связей исполнителей и жанров
INSERT INTO Artists_Genres (ArtistID, GenreID) VALUES 
(1, 2),
(1, 1),  
(2, 2),
(3, 1),
(4, 1),
(5, 3),
(6, 3),
(7, 2),
(8, 4);  

-- Вставка данных в таблицу альбомов
INSERT INTO Albums (Title, ReleaseYear) VALUES 
('Album 1', 2020),
('Album 2', 2021),
('Album 3', 2016),
('Album 4', 2017),
('Album 5', 2019),
('Album 6', 2019),
('Album 7', 2022);  

-- Вставка данных в таблицу связей альбомов и исполнителей
INSERT INTO Albums_Artists (AlbumID, ArtistID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 7),
(7, 1),  
(7, 8);  

-- Вставка данных в таблицу треков
INSERT INTO Tracks (Title, Duration, AlbumID) VALUES 
('Track 1', 2.54, 1),
('Track 2', 3.45, 2),
('Track 3', 4.33, 3),
('Track 4', 1.57, 4),
('Track 5', 1.47, 5),
('Track 6', 3.25, 6),
('Track 7', 4.00, 5),
('Track 8', 3.50, 6),
('Track 9', 1.47, 7),  
('Track 10', 5.00, 7); 

-- Вставка данных в таблицу сборников
INSERT INTO Collections (Title, ReleaseYear) VALUES 
('Collection 1', 2021),
('Collection 2', 2020),
('Collection 3', 2017),
('Collection 4', 2019);

-- Вставка данных в таблицу связей сборников и треков
INSERT INTO Collections_Tracks (CollectionID, TrackID) VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 5),
(4, 7);

