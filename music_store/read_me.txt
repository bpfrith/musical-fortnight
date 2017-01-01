dropdb music_store

createdb music_store

psql -d music_store -f db/music_store.sql

ruby db/seeds.rb  

ruby app.rb 