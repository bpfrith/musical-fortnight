require_relative( '../dB/sql_runner' )

class Stock

  attr_reader( :artist_id, :album_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @artist_id = options['artist_id']
    @album_id = options['album_id']
  end

  def save()
    sql = "INSERT INTO stock (
      artist_id, album_id
    ) VALUES (
      '#{ @artist_id }',#{ @album_id }
    ) RETURNING *"
    results = SQLRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM stock"
    results = SQLRunner.run( sql )
    return results.map { |hash| stock.new( hash ) }
  end

  def artist()
    sql = "SELECT * FROM artists a
          INNER JOIN stock s
          ON s.album_id = a.id
          WHERE a.id = #{@artist_id}"
    results = SQLRunner.run( sql )
    return Artist.new( results.first )
  end

  def album
    sql = "SELECT * FROM albums b
          INNER JOIN stock s
          ON s.album_id = b.id
          WHERE b.id = #{@album_id}"
    results = SQLRunner.run( sql )
    return Album.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM stock"
    SQLRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM stock where id = #{id}"
    SQLRunner.run( sql )
  end

end