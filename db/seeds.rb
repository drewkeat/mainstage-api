# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: "test",
  last_name: "dummy",
  email: "testdummy@email.com",
  password: "password"
)

production = Production.create(
  name: "First Production"
)

role_types = ["Performer", "Crew", "Operations"]
role_names = ["Actor",
  "Dancer",
  "Musician",
  "Artistic Director",
  "Assistant Stage Manager",
  "Carpenter",
  "Charge Artist",
  "Choreographer",
  "Company Manager",
  "Composer",
  "Costume Designer",
  "Costume Director",
  "Crew Chief",
  "Director",
  "Director of Audience Services",
  "Director of Development",
  "Director of Public Relations",
  "Director of Special Events",
  "Dramaturge",
  "Dresser",
  "Electrician",
  "Fly Crew",
  "House Manager",
  "Janitor",
  "Light Board Operator",
  "Lighting Designer",
  "Lighting Technician",
  "Literary Manager",
  "Marketing Director",
  "Master Carpenter",
  "Master Electrician",
  "Music Director",
  "Paint Crew",
  "Playbill Writer",
  "Playwright",
  "Producer",
  "Production Manager",
  "Property Master",
  "Publicist",
  "Scenic Artist",
  "Scenic Designer",
  "Set Designer",
  "Sound Designer",
  "Sound Engineer",
  "Sound Technician",
  "Spotlight Operator",
  "Stage Crew",
  "Stage Hand",
  "Stage Manager",
  "Technical Director",
  "Theater Manager",
  "Ticketing Agent",
  "Usher",
  "Wardrobe Crew",
  "Wardrobe Manager"
]

Role.create(
  name: role_names.sample,
  role_type: role_types.sample
)