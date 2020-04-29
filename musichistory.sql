SELECT * FROM Genre;

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ("Hanson", 1997);

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ("Middle of Nowhere", "5/6/1997", 3221, "Polygram Records and Mercury Records", 28, 7);

INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, GenreId, AlbumId)
VALUES
	("MMMBop", 238, "4/15/1997", 28, 7, 23),
	("Where's the Love", 254, "5/6/1997", 28, 7, 23),
	("I Will Come to You", 251, "5/6/1997", 28, 7, 23);

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId WHERE a.Title LIKE "Middle of Nowhere";

SELECT a.Title, COUNT(s.SongId) FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId GROUP BY a.AlbumId;

SELECT a.ArtistName, COUNT(s.SongId) FROM Artist a LEFT JOIN Song s ON s.ArtistId = a.ArtistId GROUP BY a.ArtistId;

SELECT g.Label, COUNT(s.SongId) FROM Genre g LEFT JOIN Song s ON s.GenreId = g.GenreId GROUP BY g.GenreId;

SELECT a.Title, MAX(a.AlbumLength) FROM Album a;

SELECT s.Title, MAX(s.SongLength) FROM Song s;

SELECT r.ArtistName, a.Title, s.Title, MAX(s.SongLength) FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId LEFT JOIN Artist r ON s.ArtistId = r.ArtistId;