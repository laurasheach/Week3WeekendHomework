require_relative('../db/sql_runner')
require_relative('film')

class Screening

  attr_accessor :show_time, :film_title_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @show_time = options['show_time']
    @film_title_id = options['film_title_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (show_time, film_title_id) VALUES ($1, $2) RETURNING id"
    values = [@show_time, @film_title_id]
    screening = SqlRunner.run(sql,values).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET (show_time, film_title_id) = ($1, $2) WHERE id = $3"
    values = [@show_time, @film_title_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#Attempt at finding out most popular film
  def self.most_popular_film()
      sql = "SELECT screenings.* FROM screenings
      INNER JOIN tickets
      ON screenings.id = tickets.screening_id;"
      screenings_by_ticket = SqlRunner.run(sql)
      all_screenings = screenings_by_ticket.map{|screening| Screening.new(screening)}
      result = all_screenings.sort_by {|x| x <=> @show_time}
      return result[0]
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = screenings.map {|screening| Screening.new(screening)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
