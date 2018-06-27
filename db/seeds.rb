# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{email: 'mike@vinova.sg', full_name: 'Mike', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jenny@vinova.sg', full_name: 'Jenny', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jonathan@vinova.sg', full_name: 'Jonathan', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'edward@vinova.sg', full_name: 'Edward', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'louis@vinova.sg', full_name: 'Louis', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'william@vinova.sg', full_name: 'William', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'julian@vinova.sg', full_name: 'Julian', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'avada@vinova.sg', full_name: 'Avada', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'daisy@vinova.sg', full_name: 'Daisy', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jane@vinova.sg', full_name: 'Jane', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'ron@vinova.sg', full_name: 'Ron', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'kai@vinova.sg', full_name: 'Kai', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'felix@vinova.sg', full_name: 'Felix', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'ryan@vinova.sg', full_name: 'Ryan', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'nea@vinova.sg', full_name: 'Nea', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'lamp@vinova.sg', full_name: 'Lamp', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'hanah@vinova.sg', full_name: 'Hanah', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'howard@vinova.sg', full_name: 'Howard', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'coby@vinova.sg', full_name: 'Coby', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'leo@vinova.sg', full_name: 'Leo', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'tommy@vinova.sg', full_name: 'Tommy', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'adam@vinova.sg', full_name: 'Adam', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'kent@vinova.sg', full_name: 'Kent', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'alan@vinova.sg', full_name: 'Alan', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'rio@vinova.sg', full_name: 'Rio', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'henry@vinova.sg', full_name: 'Henry', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jason@vinova.sg ', full_name: 'Jason', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'walter@vinova.sg', full_name: 'Walter', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'max@vinova.sg', full_name: 'Max', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'andy@vinova.sg', full_name: 'Andy', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'selena@vinova.sg', full_name: 'Selena', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jay@vinova.sg', full_name: 'Jay', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jimmyle@vinova.sg', full_name: 'Jimmy', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jack@vinova.sg', full_name: 'Jack', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'eric@vinova.sg', full_name: 'Eric', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'jess@vinova.sg', full_name: 'Jess', password: 'vinova123', password_confirmation: 'vinova123'},
  {email: 'archie@vinova.sg', full_name: 'Archie', password: 'vinova123', password_confirmation: 'vinova123'}])
Admin.create(email: 'admin@vinova.sg', password: 'vinova123', password_confirmation: 'vinova123')