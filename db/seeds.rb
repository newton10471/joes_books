# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', first_name: 'Amdin', last_name: 'Admin')
admin.save(validate: false)
admin.books.create(title: 'Joyland', author: 'Stephen King', asin: '1781162646')
admin.books.create(title: 'The Long Walk', author: 'Stephen King', asin: '0451196716')
