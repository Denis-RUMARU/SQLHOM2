-- Таблица исполнителей
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

-- Таблица жанров
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

-- Промежуточная таблица для связи исполнителей и жанров
CREATE TABLE Artists_Genres (
    ArtistID INT,
    GenreID INT,
    PRIMARY KEY (ArtistID, GenreID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Таблица альбомов
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear YEAR
);

-- Промежуточная таблица для связи альбомов и исполнителей
CREATE TABLE Albums_Artists (
    AlbumID INT,
    ArtistID INT,
    PRIMARY KEY (AlbumID, ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- Таблица треков
CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
	Duration DECIMAL(5, 2),
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- Таблица сборников
CREATE TABLE Collections (
    CollectionID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear YEAR
);

-- Промежуточная таблица для связи сборников и треков
CREATE TABLE Collections_Tracks (
    CollectionID INT,
    TrackID INT,
    PRIMARY KEY (CollectionID, TrackID),
    FOREIGN KEY (CollectionID) REFERENCES Collections(CollectionID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);