# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

role_types = {
  "Performer": [
    "Actor",
    "Dancer",
    "Musician",
  ],
  "Crew": [
    "Assistant Stage Manager",
    "Carpenter",
    "Costume Designer",
    "Crew Chief",
    "Dramaturge",
    "Dresser",
    "Electrician",
    "Fly Crew",
    "Light Board Operator",
    "Lighting Designer",
    "Lighting Technician",
    "Master Carpenter",
    "Master Electrician",
    "Paint Crew",
    "Property Master",
    "Scenic Artist",
    "Scenic Designer",
    "Set Designer",
    "Sound Designer",
    "Sound Engineer",
    "Sound Technician",
    "Spotlight Operator",
    "Stage Crew",
    "Stage Manager",
    "Wardrobe Crew",
  ],
  "Operations": [
    "Artistic Director",
    "Choreographer",
    "Company Manager",
    "Composer",
    "Director",
    "House Manager",
    "Janitor",
    "Marketing Director",
    "Music Director",
    "Playbill Writer",
    "Playwright",
    "Producer",
    "Production Manager",
    "Technical Director",
    "Ticketing Agent",
    "Usher",
  ],
}

def build_users(low_num, high_num)
  for num in low_num..high_num do
    fname = "dummy"
    lname = num.humanize
    User.create(
      first_name: fname,
      last_name: lname,
      email: fname+lname+"@email.com",
      password: "pass"
    )
  end
end

build_users(1,3)

User.all.each do |user|
  production = Production.create(
    name: "Production " + user.last_name
  )

  10.times do
    role_type = role_types.keys.sample
    role_name = role_types[role_type].sample
    role = Role.create(
      name: role_name,
      role_type: role_type,
      production_id: production.id
    )
    production.roles << role
    production.save
  end
  
  user.managed_productions << production
  user.save
end

low = User.all.length
high = low*2

build_users(low+1, high)

for num in low+1..high do
  user = User.find(num)
  3.times do
    role = Production.all.sample.roles.sample
    user.apply(role)
  end
end