require_relative( '../db/sql_runner' )
class Album
  attr_reader(:name, :quantity, :id, :artist_id, :buy_price, :sell_price, :url, :genre)
  def initialize(options)
    @name = options['name']
    @quantity = options['quantity'].to_i
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @url = options['url']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO albums
    (
      name,
      quantity,
      artist_id,
      buy_price,
      sell_price,
      url,
      genre
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @quantity, @artist_id, @buy_price, @sell_price, @url, @genre]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map {|albums| Album.new(albums)}
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Album.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def stock_level()
    if @quantity <= 15
      return "Low"
    elsif @quantity > 15 && @quantity < 30
      return "Medium"
    else @quantity >= 30
      return "High"
    end
  end

  def destroy()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE albums
    SET
    (
      name,
      quantity,
      artist_id,
      buy_price,
      sell_price,
      url,
      genre
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@name, @quantity, @artist_id, @buy_price, @sell_price, @url, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def markup_price()
    return @sell_price - @buy_price
  end

end
