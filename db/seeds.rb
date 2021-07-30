bobs_burgers = Organization.create(name: "Bob's Burgers", hourly: 10.0)
moes_tavern = Organization.create(name: "Moe's Tavern", hourly: 7.25)
sallys_sandwiches = Organization.create(name: "Sally's Sandwiches", hourly: 15.0)

jane = User.create(name: "Jane Brown", email: "janebrown@bobsburgers.com", password: "password", organization: bobs_burgers)
ellen = User.create(name: "Ellen Jones", email: "ellenjones@bobsburgers.com", password: "password", organization: bobs_burgers)

# John will be the test case for logging in without an asscociated organization
john = User.create(name: "John Smith", email: "johnsmith@bobsburgers.com", password: "password")

jane_shift_start = DateTime.new()

# Jane's Setup
jane_shift = Shift.create(user: jane, start: DateTime.parse('7th Feb 2019 10:15:00'), finish: DateTime.parse('7th Feb 2019 13:30:00'), break_length: 0)
puts 'Jane is Made'

# Ellen Setup
ellen_shift = Shift.create(user: ellen, start: DateTime.parse('31st Jan 2019 11:00:00'), finish: DateTime.parse('31st Jan 2019 23:00:00'), break_length: 1)
puts "Ellen is Made"