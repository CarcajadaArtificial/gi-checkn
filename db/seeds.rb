# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Event.create(name: "Test Event",description: "This is a test event.",urlName: "testevent",startDate:'2018-01-28',endDate:'2018-01-31',mainColor:'FF00FF',color2:'00FF00',locationCode:'75QXMP26+85')
#
ActivityType.create([{name: "Conferencia", public: true}, {name: "Taller", public: false}])
#
# Activity.create([{event_id: 1, activity_type_id: 1, name: "Conferencia1",description: "Es la primera conferencia", date:'2018-01-29', time:"13:00", location:"Aulas 3", host:"Pancho Pantera", capacity: 300},
#                  {event_id: 1, activity_type_id: 1, name: "Conferencia2",description: "Es la primera conferencia", date:'2018-01-28', time:"12:00", location:"Aulas 3", host:"Pancho Pantera", capacity: 300},
#                  {event_id: 1, activity_type_id: 1, name: "Conferencia2",description: "Es la primera conferencia", date:'2018-01-30', time:"12:00", location:"Aulas 3", host:"Pancho Pantera", capacity: 300},
#                  {event_id: 1, activity_type_id: 2, name: "Taller1",description: "Es la primera conferencia", date:'2018-01-28', time:"14:00", location:"Aulas 3", host:"Pancho Pantera", capacity: 300},
#                  {event_id: 1, activity_type_id: 2, name: "Taller2",description: "Es la primera conferencia", date:'2018-01-29', time:"15:00", location:"Aulas 3", host:"Pancho Pantera", capacity: 300}])
#
# TicketType.create([{event_id: 1, name: "Azul", description: "Boleto Azul", price: "100.00"},
#                    {event_id: 1, name: "Rojo", description: "Boleto Rojo", price: "150.00"}])
#
# SingleAccess.create([{ticket_type_id: 1, activity_id: 1},
#                      {ticket_type_id: 2, activity_id: 4}])
#
# MultipleAccess.create([{ticket_type_id: 1, activity_type_id: 1, amount: 2},
#                        {ticket_type_id: 2, activity_type_id: 2, amount: 2}])
#
# Question.create([{ticket_type_id: 1, sentence: "What is love?"},
#                  {ticket_type_id: 1, sentence: "This too shall pass"}])
