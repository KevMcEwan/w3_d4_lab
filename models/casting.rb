require_relative('../db/sql_runner')

class Casting

  attr_reader :id, :movie_id, :star_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee'].to_i
  end

  def save
    sql = 'INSERT INTO castings
            (movie_id, star_id, fee)
            VALUES ($1,$2,$3)
            RETURNING id;
    '
    params = [@movie_id,@star_id,@fee]
    @id = SqlRunner.run(sql, params).first['id'].to_i
  end

  def self.delete_all
    SqlRunner.run('DELETE from castings')
  end

end
