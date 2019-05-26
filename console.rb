require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Laura', 'funds' => 100})
customer1.save()
customer2 = Customer.new({'name' => 'Hazel', 'funds' => 50})
customer2.save()
customer3 = Customer.new({'name' => 'Gordon', 'funds'=> 75})
customer3.save()
customer4 = Customer.new({'name' => 'Anne', 'funds' => 65})
customer4.save()
customer5 = Customer.new({'name' => 'Alastair', 'funds' => 90})
customer5.save()

film1 = Film.new({'title' => 'Trainspotting', 'price' => 7})
film1.save()
film2 = Film.new({'title' => 'Jackie Brown', 'price' => 8})
film2.save()
film3 = Film.new({'title' => 'Pride', 'price' => 8})
film3.save()
film4 = Film.new({'title' => 'Finding Nemo', 'price' => 7})
film4.save()
film5 = Film.new({'title' => 'Star Trek', 'price' => 9})
film5.save()

screening1 = Screening.new({'show_time' => '15:00', 'film_title_id' => film1.id})
screening1.save()
screening2 = Screening.new({'show_time' => '16:00', 'film_title_id' => film2.id})
screening2.save()
screening3 = Screening.new({'show_time' => '16:30', 'film_title_id' => film1.id})
screening3.save()
screening4 = Screening.new({'show_time' => '15:30', 'film_title_id' => film3.id})
screening4.save()
screening5 = Screening.new({'show_time' => '14:00', 'film_title_id' => film4.id})
screening5.save()
screening6 = Screening.new({'show_time' => '17:00', 'film_title_id' => film5.id})
screening6.save()
screening7 = Screening.new({'show_time' => '18:00', 'film_title_id' => film1.id})
screening7.save()
screening8 = Screening.new({'show_time' => '19:00', 'film_title_id' => film2.id})
screening8.save()
screening9 = Screening.new({'show_time' => '19:30', 'film_title_id' => film3.id})
screening9.save()
screening10 = Screening.new({'show_time' => '20:00', 'film_title_id' => film4.id})
screening10.save()
screening11 =Screening.new({'show_time' => '21:00', 'film_title_id' => film5.id})
screening11.save()
screening12 = Screening.new({'show_time' => '23:00', 'film_title_id' => film1.id})
screening12.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id,
  'screening_id' => screening2.id
  })
ticket1.save()
ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id,
  'screening_id' => screening2.id
  })
ticket2.save()
ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id,
  'screening_id' => screening12.id
  })
ticket3.save()
ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id,
  'screening_id' => screening12.id
  })
ticket4.save()
ticket5 = Ticket.new({
  'customer_id' => customer4.id,
   'film_id' => film4.id,
   'screening_id' => screening5.id
      })
ticket5.save()
ticket6 = Ticket.new({
  'customer_id' => customer5.id,
   'film_id' => film4.id,
   'screening_id' => screening5.id
   })
ticket6.save()
ticket7 = Ticket.new({
  'customer_id' => customer1.id,
   'film_id' => film3.id,
   'screening_id' => screening9.id
   })
ticket7.save()
ticket8 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film5.id,
  'screening_id' => screening11.id
  })
ticket8.save()
ticket9 = Ticket.new({
  'customer_id' => customer4.id,
   'film_id' => film5.id,
   'screening_id' => screening11.id
   })
ticket9.save()
ticket10 = Ticket.new({
  'customer_id' => customer5.id,
   'film_id' => film5.id,
   'screening_id' => screening11.id
   })
ticket10.save()


# Update

# customer3.funds = 40
# customer3.update()
#
# film4.title = '9 to 5'
# film4.update()
#
# screening1.show_time = '14:30'
# screening1.update()
#
# ticket4.customer_id = customer2.id
# ticket4.update()

# Delete

# customer3.delete()
#
# film4.delete()
#
# screening8.delete()
#
# ticket4.delete()

all_customers = Customer.all()
all_films = Film.all()
all_screenings = Screening.all()
all_tickets = Ticket.all()

popular_film = Screening.most_popular_film()

binding.pry
nil
