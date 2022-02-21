# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "*** CLEANING STAGE ***"
# Emptying all 3 tables
Attendance.destroy_all
puts "  > Attendances destroyed"
Event.destroy_all
puts "  > Events destroyed"
User.destroy_all
puts "  > Users destroyed"

puts "*** CREATION STAGE ***"
# Creating and filling 3 users
User.create(first_name: "Jean-Baptiste",
            last_name: "VIDAL",
            mail: "gibbz01@yopmail.com",
            pwd: "THP_2022",
            age: "43",
            description: "El padre")

User.create(first_name: "Valérie-Anne",
            last_name: "DELAIDDE",
            mail: "gibbz02@yopmail.com",
            pwd: "THP_2022",
            age: "44",
            description: "La madre")

User.create(first_name: "Lucie",
            last_name: "VIDAL-DELAIDDE",
            mail: "gibbz03@yopmail.com",
            pwd: "THP_2022",
            age: "7",
            description: "La hija")
puts "  > 3 users created"

# Creating and filling 4 events (2 by User "Jean-Baptiste", 1 by "Valérie-Anne", and 1 by "Lucie")
Event.create(title: "Evénement #1",
             location: "Orléans",
             duration: 480,
             description: "Evénement de test organisé par Jean-Baptiste",
             price: 99,
             start_date: "2022-03-27",
             promoter_id: User.all.first.id)   # Jean-Baptiste 

Event.create(title: "Evénement #2",
             location: "Saint-Denis-en-Val",
             duration: 2400,
             description: "Evénement de test (aussi) organisé par Jean-Baptiste",
             price: 270378,
             start_date: "2022-12-25",
             promoter_id: User.all.first.id)   # Jean-Baptiste 

Event.create(title: "Evénement #3",
             location: "Paris",
             duration: 240,
             description: "Evénement de test organisé par Valérie-Anne",
             price: 249,
             start_date: "2022-07-06",
             promoter_id: User.all[1].id)   # Valérie-Anne

Event.create(title: "Evénement #4",
             location: "La chambre de Lucie",
             duration: 60,
             description: "Evénement de test organisé par Lucie",
             price: 9,
             start_date: "2022-07-03",
             promoter_id: User.all.last.id)   # Lucie
puts "  > 4 events created"

# Creating and filling links between events and users attending
Attendance.create(event_id: Event.all[0].id,
                  attendee_id: User.all[1].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_1")

Attendance.create(event_id: Event.all[0].id,
                  attendee_id: User.all[2].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_2")

Attendance.create(event_id: Event.all[1].id,
                  attendee_id: User.all[1].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_3")

Attendance.create(event_id: Event.all[2].id,
                  attendee_id: User.all[0].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_4")

Attendance.create(event_id: Event.all[2].id,
                  attendee_id: User.all[2].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_5")

Attendance.create(event_id: Event.all[3].id,
                  attendee_id: User.all[0].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_6")

Attendance.create(event_id: Event.all[3].id,
                  attendee_id: User.all[2].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_7")
puts "  > Links between users and events created"

# End of SEED