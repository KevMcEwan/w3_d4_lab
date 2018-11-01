

class Movie

  attr_reader :id, :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies (title, genre) VALUES ($1, $2) RETURNING *"
    values = [@title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def stars
    sql = '
      select
	      *
      from
	      movies
	      inner join castings on movies.id = castings.movie_id
	      inner join stars on castings.star_id = stars.id
      where
	      movie_id = $1
    '
    params = [@id]
    results = SqlRunner.run(sql, params)
    results.map {|actor| Star.new(actor)}
  end

end
