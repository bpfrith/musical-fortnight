DROP TABLE IF EXISTS inventory, albums, artists;

CREATE TABLE artists (
id SERIAL8 primary key,
name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 primary key,
  title VARCHAR(255),
  quantity INT8,
  genre VARCHAR(255),
  buy_price DECIMAL(3,2),
  sell_price DECIMAL(3,2),
  mark_up DECIMAL(3,2)
);

CREATE TABLE inventory
(
  id SERIAL8 primary key,
  artist_id INT8 references artists(id),
  album_id INT8 references albums(id)
);