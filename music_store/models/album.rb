require_relative( '../dB/sql_runner' )

class Album

  attr_accessor :title, :quantity, :genre, :buy_price, :sell_price , :mark_up
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i unless options['id'].nil?
    @artist_id = options['artist_id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @genre = options['genre']
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @mark_up = @sell_price - @buy_price #options['mark_up'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    albums = SQLRunner.run(sql)
    return albums.map { |order| Album.new(order) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = {#artist_id};"
    artist = SQLRunner.run(sql)
    return Artist.new(artist)
  end

  def save()
    sql =
    "
    INSERT INTO albums
    (title, quantity, genre, buy_price, sell_price)
    VALUES
    ('#{@title}', #{@quantity}, '#{@genre}', #{@buy_price}, #{@sell_price})
    RETURNING *;
    "
    result = SQLRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SQLRunner.run(sql)
    return albums.map { |hash| Album.new(hash) }
  end

  def update()
    sql = "
      UPDATE albums
      SET (title, quantity, genre, buy_price, sell_price, mark_up) =
      ('#{@title}', #{@quantity}, '#{@genre}', #{@buy_price}, #{@sell_price}, #{@mark_up})
      WHERE id = #{@id}
    ;"
    result = SQLRunner.run(sql)
    return result
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = {id}"
    SQLRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SQLRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    result = SQLRunner.run(sql)
    return Artist.new(result)
  end

  # def calc_mark_up()
  #   @mark_up = @sell_price - @buy_price
  #   update()
  # end

end