require_relative( '../dB/sql_runner' )

class Album

  attr_accessor :title, :quantity, :genre, :buy_price, :sell_price , :mark_up, :stock_level, :albums_sold
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
    @stock_level = options['stock_level']
    @albums_sold = options['albums_sold'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    albums = SQLRunner.run(sql)
    return albums.map { |order| Album.new(order) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    artist = SQLRunner.run(sql).first
    return Artist.new(artist)
  end

  def save()
    sql =
    "
    INSERT INTO albums
    (artist_id, title, quantity, genre, buy_price, sell_price)
    VALUES
    (#{artist_id}, '#{@title}', #{@quantity}, '#{@genre}', #{@buy_price}, #{@sell_price})
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
      SET (title, quantity, genre, buy_price, sell_price, mark_up, albums_sold) =
      ('#{@title}', #{@quantity}, '#{@genre}', #{@buy_price}, #{@sell_price}, #{@mark_up}, #{@albums_sold})
      WHERE id = #{@id}
    ;"
    result = SQLRunner.run(sql)
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM albums WHERE id = #{id};"
    SQLRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    SQLRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    result = SQLRunner.run(sql).first
    return Album.new(result)
  end

  # def self.sell(id)
  #   @quantity -= 1
  #   update()
  # end

  # def calc_mark_up()
  #   @mark_up = @sell_price - @buy_price
  #   update()
  # end

  def stock_level()
    if @quantity >= 6
      @stock_level = "High"
    elsif @quantity >= 3 && @quantity <= 5
      @stock_level = "Medium"
    else @quantity <= 3
      @stock_level = "Low"
    # else @stock_level = "Invalid"
    end
    # case @quantity
    #   when 0..2 then @stock_level = "Low"
    #   when 3..5 then @stock_level = "Medium"
    #   when 6..100 then @stock_level = "High"
    #   else "Invalid"
    # end
  end

  # def update_quantity()
  #   sql = "
  #     UPDATE albums
  #     SET (quantity) =
  #     (#{@quantity})
  #     WHERE id = #{@id}
  #   ;"
  #   result = SQLRunner.run(sql)
  #   return result
  # end

end