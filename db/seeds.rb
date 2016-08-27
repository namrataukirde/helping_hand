puts "********** Creating volunteer ***********"
volunteer = Volunteer.new(name: "Tushar Titame", age: 23, gender: true,
  qualification: 0 )

User.create(email: "tushar.titame@kiprosh.com", password: "password@1234",
  detail: volunteer)

Address.create(address_line: "Dadar", city: "Mumbai", state: "Maharashtra", country: "Mumbai", pincode: 400325, resource: volunteer )

puts "*********** Volunteer created************"

puts "*********** Creating NGO *****************"

ngo = Ngo.new(name: "Happy World", description: "We work for orphans and currently we are having 1000 orphans in our orphanage", category: 0 )

User.create(email: "rohan.pujari@kiprosh.com", password: "password@1234", detail: ngo)

Address.create(address_line: "Sakinaka", city: "Mumbai", state: "Maharashtra", country: "Mumbai", pincode: 400345, resource: ngo )

puts "************** NGO created ****************"

puts "*************** Creating Items with state as waiting ************"

5.times do |n|
  Item.create(donor_id: Volunteer.first.id, state: "waiting", category: 0, quantity: n, description: "add some description", receiver_id: nil)
end

puts "*************** Creating Items with state as accepted ************"

5.times do |n|
  Item.create(donor_id: Volunteer.first.id, state: "accepted", category: 1, quantity: n, description: "add some description", receiver_id: Ngo.first.id)
end



