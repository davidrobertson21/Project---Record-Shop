DROP TABLE albums;
DROP TABLE genres;
DROP TABLE artists;

CREATE TABLE artists
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE genres
(
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE albums
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT8 REFERENCES artists(id),
  album_id INT8 REFERENCES albums(id),
  quantity INT8,
  buy_price FLOAT,
  album_artwork VARCHAR(255)
);