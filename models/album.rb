require_relative('../db/sql_runner')

class Album

  attr_reader :id, :title, :artist_id, :genre_id, :quantity, :buy_price, :album_artwork

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @artist_id = options['artist_id']
    @genre_id = options['genre_id']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_f
    @album_artwork = options['album_artwork']
  end



  def save()
    sql = "INSERT INTO albums ( title, artist_id, genre_id, quantity, buy_price, album_artwork ) VALUES ('#{ @title }',#{ @artist_id },#{ @genre_id },#{ @quantity }, #{ @buy_price }, '#{album_artwork}') 
      RETURNING *;"
    album_data = SqlRunner.run(sql)
    @id = album_data.first()['id'].to_i
  end


  def update()
    sql = "UPDATE albums SET
      title = '#{ @title }',
      artist_id = #{ @artist_id },
      genre_id = #{ @genre_id },
      quantity = #{ @quantity },
      buy_price = #{ @buy_price },
      album_artwork = '#{ @album_artwork }'

      WHERE id = '#{ @id }';"
    SqlRunner.run( sql )
  end        


  def delete()
    sql = "DELETE FROM albums WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end


  def artist
    sql = "SELECT * FROM artists
          INNER JOIN albums
          ON albums.artist_id = artists.id
          WHERE artists.id = #{@artist_id}"
    results = SqlRunner.run( sql )
    return Artist.new( results.first )
  end


  def genre
    sql = "SELECT * FROM genres g
          INNER JOIN albums a
          ON a.genre_id = g.id
          WHERE g.id = #{@genre_id}"
    results = SqlRunner.run( sql )
    return Genre.new( results.first )
  end


  def stock_levels()
    if @quantity <= 5
      return "Low Stock"
    elsif @quantity <= 10
      return "Medium Stock"
    elsif @quantity <= 19
      return "Plenty of Stock"
    else
      return "Full Stock"
    end
  end


  def buy_price_total_for_all_album_in_stock()
    return @quantity * @buy_price
  end


  def sell_price()
    return @buy_price * 1.3
  end


  def profit()
    return (@buy_price * 1.3) - @buy_price
  end

  def potential_profit()
    return ((@buy_price * 1.3) * @quantity) - (@buy_price * @quantity)
  end

  def sell_album(num)
    return @quantity -= num
  end



  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run( sql )
    result = albums.map { |album| Album.new( album ) }
    return result
  end


  def self.delete_all()
   sql = "DELETE FROM albums"
   SqlRunner.run( sql )
 end
  

  def self.find( id )
    sql = "SELECT * FROM albums WHERE id=#{id};"
    album = SqlRunner.run( sql )
    result = Album.new( album.first )
    return result
  end

end
