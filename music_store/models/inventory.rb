require_relative( '../dB/sql_runner' )

class Inventory

  attr_reader( :artist_id, :album_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @artist_id = options['artist_id']
    @album_id = options['album_id']
  end

  def save()
    sql = "INSERT INTO inventory (
      artist_id, album_id
    ) VALUES (
      '#{ @artist_id }',#{ @album_id }
    ) RETURNING *"
    results = SQLRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM inventory"
    results = SQLRunner.run( sql )
    return results.map { |hash| Inventory.new( hash ) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE artists.id = #{@artist_id}"
    results = SQLRunner.run( sql )
    return Artist.new( results.first )
  end

  def album()
    sql = "SELECT * FROM albums WHERE albums.id = #{@album_id}"
    results = SQLRunner.run( sql )
    return Album.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM inventory"
    SQLRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM inventory where id = #{id}"
    SQLRunner.run( sql )
  end

end