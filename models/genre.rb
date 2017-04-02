require_relative('../db/sql_runner')

class Genre

  attr_reader :id, :type

  def initialize( options )
    @id = options['id'].to_i
    @type = options['type']
  end



  def save()
    sql = "INSERT INTO genres ( type ) VALUES ('#{ @type }') 
      RETURNING *;"
    genre_data = SqlRunner.run(sql)
    @id = genre_data.first()['id'].to_i
  end


  def update()
    sql = "UPDATE genres SET
      type = '#{ @type }',

      WHERE id = '#{ @id }';"
    SqlRunner.run( sql )
  end        


  def delete()
    sql = "DELETE FROM genres WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end


  def self.all()
    sql = "SELECT * FROM genres;"
    genres = SqlRunner.run( sql )
    result = genres.map { |genre| Genre.new( genre ) }
    return result
  end


  def self.delete_all()
   sql = "DELETE FROM genres"
   SqlRunner.run( sql )
 end
  

  def self.find( id )
    sql = "SELECT * FROM genres WHERE id=#{id};"
    genre = SqlRunner.run( sql )
    result = Genre.new( genre.first )
    return result
  end

end
