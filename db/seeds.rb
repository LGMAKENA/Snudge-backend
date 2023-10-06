# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


categories = Category.all
if categories.length == 0 
    puts "🍂Seeding categories..."
    Category.create(category_name: "Devops")
    Category.create(category_name: "FrontEnd")
end
users = User.all
if users.length == 0 
    puts "🍂Seeding users..."
  
User.create(full_name: "Administrator", username: "admin", email: "admin@example", password: "pass@123", role: "admin")
User.create(full_name: "Jeff", username: "jeff", email: "jeff@example", password: "pass@123", role: "admin")
User.create(full_name: "Linet", username: "lmakena", email: "linetmakena@gmail.com", password: "pass@123", role: "student")
User.create(full_name: "Brian", username: "Dexter", email: "dexter@gmail.com", password: "pass@123", role: "staff")
end