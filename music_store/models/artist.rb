require_relative( '../db/sql_runner' )

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i unless options['id'].nil?
    @name = options['name']
  end

  # def albums()
  #   sql = "SELECT * FROM albums WHERE artist_id = #{id};"
  #   albums = SQLRunner.run(sql)
  #   return albums.map { |album| Album.new(album) }
  # end

  # def album_titles()
  #   sql = "SELECT album.title WHERE artist_id = #{id};"
  #   albums = SQLRunner.run(sql)
  #   return albums.map { |album| Album.new(album) }
  # end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SQLRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def save()
    sql =
    "
    INSERT INTO artists
    (name)
    VALUES
    ('#{@name}')
    RETURNING *;
    "
    result = SQLRunner.run(sql)
    first_hash = result[0]
    id = first_hash["id"]
    @id = id.to_i
  end

  def update()
    sql = "
      UPDATE artits
      SET (name) =
      ('#{@name}')
      WHERE id = #{@id}
    ;"
    result = SQLRunner.run(sql)
    return result
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = {@id}"
    SQLRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SQLRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id};"
    result = SQLRunner.run(sql)
    return Artist.new(result)
  end

end