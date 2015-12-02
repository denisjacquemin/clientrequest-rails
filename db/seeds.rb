# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(name: 'Acp assurances sprl')
Company.create(name: 'Company 2')

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

FormType.create(label: 'Etude auto', filename: 'etude_auto')
FormType.create(label: 'Etude Incendie', filename: 'etude_incendie')
