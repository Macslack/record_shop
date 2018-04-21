DROP TABLE artists;
DROP TABLE albums;

CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE albums
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  quantity INT8,
  artist_id references artists(id)
);
