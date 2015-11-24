# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

FormType.create(label: 'Formulaire 1', filename: 'form1')
FormType.create(label: 'Formulaire 2', filename: 'form2')

Form.create(uid: 'klj45lkjlk4j5566#292', type_id: 1, author_id: 1)
Form.create(uid: 'klioiofdoidf@!66#292', type_id: 2, author_id: 1)
