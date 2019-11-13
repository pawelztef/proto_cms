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


puts "Creating Users"

admin = User.new
admin.username = 'admin'
admin.first_name = 'Admin'
admin.second_name = 'Admin'
admin.email = 'admin@admin.com'
admin.role = 2
admin.password = 'password'
admin.password_confirmation = 'password'
admin.save!
created_objects += 1

puts "Creating pages"

["home", "about", "products", "contact"].each do |n| 
  page = Page.new
  page.name = n
  page.permalink = "perm_" + n
  page.content = "lorem ipsum"
  page.type = "HomePage" if n == "home"
  page.save!
  created_objects += 1
end

puts "Creating categories"

15.times do |n|
  cat = Category.new
  cat.name = cat.slug = Faker::Music.genre
  cat.description = Faker::Lorem.sentence(word_count: 5)
  cat.save!
  created_objects += 1
end

puts "Creating tags"

15.times do |n|
  cat = Tag.new
  cat.name = cat.slug = Faker::ProgrammingLanguage.name
  cat.description = Faker::Lorem.sentence(word_count: 5)
  cat.save!
  created_objects += 1
end

puts "Creating posts"

10.times do |n|
  summary = ""
  10.times { |n| summary += Faker::Lorem.sentence(word_count: 15) }

  title = Faker::Book.title

  post = Post.new
  post.title = title
  post.permalink = title.parameterize
  post.content = Faker::Lorem.paragraph(sentence_count: 15)
  post.summary = summary
  post.save!
  post.status = "published" if n.even?

  created_objects += 1
end

puts "Seeding finished - #{ created_objects } objects created."
