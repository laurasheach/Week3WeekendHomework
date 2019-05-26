require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Ticket.delete_all()
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

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film4.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket7.save()
ticket8 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film5.id})
ticket8.save()
ticket9 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film5.id})
ticket9.save()
ticket10 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film5.id})
ticket10.save()

# Update

# customer3.funds = 40
# customer3.update()
#
# film4.title = '9 to 5'
# film4.update()
#
# ticket4.customer_id = customer2.id
# ticket4.update()

# Delete

# customer3.delete()
#
# film4.delete()
#
# ticket4.delete()

all_customers = Customer.all()
all_films = Film.all()
all_tickets = Ticket.all()

binding.pry
nil
