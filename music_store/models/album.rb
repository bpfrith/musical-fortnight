require_relative( '../db/sql_runner' )

class Album

  attr_accessor :title, :quantity; :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i unless options['id'].nil?
    @title = options['title']
    @quantity = options['quantity']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i unless options ["artist_id"].nil?
  end

  # def albums()
  #   sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  #   albums = SQLRunner.run(sql)
  #   return albums.map { |order| Album.new(order) }
  # end

  def artist()
    sql = "SELECT * FROM artists WHERE id = {#artist_id};"
    artist = SQLRunner.run(sql)
    return Artist.new(artist)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SQLRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def save()
    sql =
    "
    INSERT INTO albums
    (title, quantity, genre, artist_id)
    VALUES
    ('#{@title}', #{@quantity} '#{@genre}', #{@artist_id})
    RETURNING *;
    "
    result = SQLRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "
      UPDATE albums
      SET (title, quantity, genre, artist_id) =
      ('#{@title}', #{@quantity}'#{@genre}', #{@artist_id})
      WHERE id = #{@id}
    ;"
    result = SQLRunner.run(sql)
    return result
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = {@id}"
    SQLRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end

end