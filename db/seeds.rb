# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.all.empty?
    puts "Seeding default Admin"
    Admin.create({first_name: 'Nix', last_name: 'Cabrera', email:'admin@example.com', password: 'password', password_confirmation: 'password', status: true})
else
    puts "Default Admin seeded"
end

if Staff.all.empty?
    puts "Seeding default Staff"
    Staff.create({first_name: 'Nix', last_name: 'Cabrera', email:'staff@example.com', password: 'password', password_confirmation: 'password'})
else
    puts "Default Staff seeded"
end