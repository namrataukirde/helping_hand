puts "********** Creating volunteer ***********"
volunteer = Volunteer.new(name: "Tushar Titame", age: 23, gender: true,
  occupation: 0 )

User.create(email: "tushar.titame@kiprosh.com", password: "password@1234",
  detail: volunteer)

Address.create(address_line: "Dadar", city: "Mumbai", state: "Maharashtra", country: "Mumbai", pincode: 400325, resource: volunteer,
  contact_number: "8655696585" )

puts "*********** Volunteer created************"

puts "*********** Creating NGO *****************"

ngo = Ngo.new(name: "Happy World", description: "We work for orphans and currently we are having 1000 orphans in our orphanage", category: 0 )

User.create(email: "rohan.pujari@kiprosh.com", password: "password@1234", detail: ngo)

Address.create(address_line: "Sakinaka", city: "Mumbai", state: "Maharashtra", country: "Mumbai", pincode: 400345, resource: ngo,
  contact_number: "8898949514" )

puts "************** NGO created ****************"

puts "*************** Creating Items with state as pending ************"

5.times do |n|
  Item.create(name: "Elixir", donor_id: Volunteer.first.id, state: "pending",
    category: 0, quantity: n, description: "add some description", receiver_id: nil)
end

puts "*************** Creating Items with state as accepted ************"

5.times do |n|
  Item.create(name: "Being Human", donor_id: Volunteer.first.id,
    state: "ngo_accepted",
    category: 1, quantity: n, description: "add some description",
    receiver_id: Ngo.first.id, scheduled_time: Time.now)
end

puts "********* Creating Items with state as volunteer-confirmed **********"

5.times do |n|
  Item.create(name: "Nike", donor_id: Volunteer.first.id,
    state: "volunteer_confirmed",
    category: 2, quantity: n, description: "add some description",
    receiver_id: Ngo.first.id, scheduled_time: Time.now)
end

puts "********* Creating Items with state as ngo-received **********"

5.times do |n|
  Item.create(name: "Video Game - Play Station", donor_id: Volunteer.first.id,
    state: "received",
    category: 3, quantity: n, description: "add some description",
    receiver_id: Ngo.first.id, scheduled_time: Time.now.prev_day)
end

