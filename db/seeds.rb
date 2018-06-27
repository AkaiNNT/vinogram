# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'admin@vinova.sg', password: 'vinova123', password_confirmation: 'vinova123')

full_name = [['Mike','0868928422'],
             ['Jenny','0976001988'],
             ['Jonathan','01289086523'],
             ['Edward','01677110700'],
             ['Louis','0968339631'],
             ['William','0908939834'],
             ['Julian','0974412542'],
             ['Avada','01669793776'],
             ['Daisy','01218396481'],
             ['Jane','0982884242'],
             ['Ron','0919007867'],
             ['Kai','0986131381'],
             ['Felix','0914194129'],
             ['Ryan','0901390712'],
             ['Nea','0934118037'],
             ['Lamp','0979518885'],
             ['Hanah','01225735808'],
             ['Howard','0903406936'],
             ['Coby','0972956099'],
             ['Leo','0904144490'],
             ['Tommy','0961400075'],
             ['Adam','0987527683'],
             ['Kent','0978314355'],
             ['Alan','01629828750'],
             ['Rio','01669697146'],
             ['Henry','0868907903'],
             ['Jason','01647929422'],
             ['Walter','0974250742'],
             ['Max','01652637460'],
             ['Andy','01249824889'],
             ['Selena','01652634721'],
             ['Jay','01666753922'],
             ['Jimmy','0989112644'],
             ['Jack','01255319497'],
             ['Eric','0907966262'],
             ['Jess','01657656107'],
             ['Archie','0906787605']]
password = 'vinova123'

full_name.each do |name, contact_number|
  User.create(email: name.downcase + '@vinova.sg', full_name: name, contact_number: contact_number, password: password, password_confirmation: password)
end
