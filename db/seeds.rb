# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
puts "Seeding started"
created_objects = 0

admin = User.new
admin.username = 'admin'
admin.first_name = 'Admin'
admin.second_name = 'Admin'
admin.email = 'admin@admin.com'
admin.owner = 1
admin.password = 'password'
admin.password_confirmation = 'password'
admin.subscriber!
admin.save!
created_objects += 1

["about", "products", "contact"].each do |n| 
  page = Page.new
  page.name = n
  page.permalink = "perm_" + n
  page.content = "lorem ipsum"
  page.save!
  created_objects += 1
end

puts "Seeding finished - #{ created_objects } objects created."
