--Название и продолжительность самого длительного трека
SELECT Title, Duration
FROM Tracks
ORDER BY Duration DESC
LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут
SELECT Title
FROM Tracks
WHERE Duration >= 3.5;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT Title
FROM Collections
WHERE ReleaseYear BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова
SELECT Name
FROM Artists
WHERE Name NOT LIKE '% %';

--Название треков, которые содержат слово мой или my
SELECT Title
FROM Tracks
WHERE Title LIKE '%мой%' OR Title LIKE '%my%';


--Количество исполнителей в каждом жанре
SELECT G.Name AS Genre, COUNT(ag.ArtistID) AS ArtistCount
FROM Genres G
JOIN Artists_Genres ag ON G.GenreID = ag.GenreID
GROUP BY G.Name;

--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT A.Title AS Album, COUNT(T.TrackID) AS TrackCount
FROM Albums A
JOIN Tracks T ON A.AlbumID = T.AlbumID
WHERE A.ReleaseYear BETWEEN 2019 AND 2020
GROUP BY A.Title;


--Средняя продолжительность треков по каждому альбому
SELECT A.Title AS Album, AVG(T.Duration) AS AvgDuration
FROM Albums A
JOIN Tracks T ON A.AlbumID = T.AlbumID
GROUP BY A.Title;

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT AR.Name
FROM Artists AR
WHERE AR.ArtistID NOT IN (
    SELECT AA.ArtistID
    FROM Albums A
    JOIN Albums_Artists AA ON A.AlbumID = AA.AlbumID
    WHERE A.ReleaseYear = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT C.Title
FROM Collections C
JOIN Collections_Tracks ct ON C.CollectionID = CT.CollectionID
JOIN Tracks T ON CT.TrackID = T.TrackID
JOIN Albums A ON T.AlbumID = A.AlbumID
JOIN Albums_Artists AA ON A.AlbumID = AA.AlbumID
JOIN Artists AR ON AA.ArtistID = AR.ArtistID
WHERE AR.Name = 'Adele';
--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT A.Title
FROM Albums A
JOIN Albums_Artists AA ON A.AlbumID = AA.AlbumID
JOIN Artists_Genres AG ON AA.ArtistID = AG.ArtistID
GROUP BY A.Title
HAVING COUNT(DISTINCT AG.GenreID) > 1;

--Наименования треков, которые не входят в сборники
SELECT T.Title
FROM Tracks T
LEFT JOIN Collections_Tracks CT ON T.TrackID = CT.TrackID
WHERE CT.TrackID IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT A.Name
FROM Artists A
JOIN Albums_Artists AA ON A.ArtistID = AA.ArtistID
JOIN Tracks T ON AA.AlbumID = T.AlbumID
WHERE T.Duration = (SELECT MIN(Duration) FROM Tracks);

--Названия альбомов, содержащих наименьшее количество треков
SELECT A.Title
FROM Albums A
JOIN Tracks T ON A.AlbumID = T.AlbumID
GROUP BY A.AlbumID
HAVING COUNT(T.TrackID) = (
  SELECT MIN(track_count) FROM (
    SELECT COUNT(T.TrackID) AS track_count
    FROM Albums A
    JOIN Tracks T ON A.AlbumID = T.AlbumID
    GROUP BY A.AlbumID
  ) AS subquery
);