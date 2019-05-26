require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_accessor :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id =$3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#Show which customers are coming to see one film ordered by customer name
  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE film_id = $1
    ORDER BY name ASC"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def customer_numbers()
    customers = self.customers
    total_customers = customers.count
    return total_customers
  end

#Show the all the show times for a film
  def show_times()
    sql = "SELECT films.title, screenings.show_time FROM films
    INNER JOIN screenings
    ON films.id = screenings.film_id
    WHERE film_id = $1"
    values = [@id]
    show_times = SqlRunner.run(sql, values)
    result = show_times.map {|show_time| Screening.new(show_time)}
    return result
  end

  def tickets_by_film
    sql = "SELECT screenings.* FROM screenings
    INNER JOIN tickets
    ON screenings.id = tickets.screening_id
    WHERE film_title_id = $1"
    values = [@id]
    tickets_by_film = SqlRunner.run(sql, values)
    result = tickets_by_film.map {|film| Film.new(film)}
    return result.count
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
