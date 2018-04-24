

DROP TABLE albums;
DROP TABLE artists;


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
  artist_id INT8 references artists(id) ON DELETE CASCADE,
  buy_price INT8,
  sell_price INT8
);
