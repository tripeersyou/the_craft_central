# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'roo'
xlsx = Roo::Excelx.new('./db/products.xlsx')
stores = Roo::Excelx.new('./db/stores.xlsx')
header = [xlsx.sheet(0).row(1),xlsx.sheet(0).row(2)]

if Admin.all.empty?
    puts "Seeding default Admin"
    Admin.create({first_name: 'Alexis Dianne', last_name: 'Ventura', email:'admin@example.com', password: 'password', password_confirmation: 'password', status: true})
else
    puts "Default Admin seeded"
end

if Staff.all.empty?
    puts "Seeding default Staff"
    Staff.create({first_name: 'Alexis Dianne', last_name: 'Ventura', email:'staff@example.com', password: 'password', password_confirmation: 'password'})
else
    puts "Default Staff seeded"
end

puts ""

if Brand.all.empty?
    puts "Seeding Brands . . ."
    puts ""
    brand_names = []
    xlsx.sheet(0).each do |row|
        if !header.include? row
            brand_names << row[0]
        end
    end

    brand_names = brand_names.uniq
    brand_names.each do |brand_name|
        Brand.create({name: brand_name})
        puts "Brand #{brand_name} has been seeded."
    end
else 
    puts "Brands have been seeded."
end

puts ""

if Product.all.empty?
    puts "Seeding Products . . ."
    puts ""
    xlsx.sheet(0).each do |row|
        if !header.include? row
            product = Product.new
            product.sku = row[2].to_s
            product.brand = Brand.find_by_name(row[0])
            product.name = row[1].to_s
            product.description = row[1].to_s
            product.price = row[3].to_f
            product.limit = 20
            product.cost = row[3].to_f - (row[3].to_f * 0.05)
            product.inventory = 100
            product.save
            puts "Product #{product.name} has been seeded."
        end
    end
else 
    puts "Products have been seeded."
end

puts ""

if Store.all.empty?
    puts "Seeding Stores . . ."
    puts ""
    stores.sheet(0).each do |row|
        store = Store.new
        store.name = row[0]
        store.address = row[1]
        if !row[2].nil?
            store.contact_number = row[2]
        end

        if !row[3].nil?
            store.email = row[3]
        end

        if !row[4].nil?
            store.contact_person = row[4]
        end

        store.save

        puts "Store #{store.name} seeded."
    end
else
    puts "Stores have been seeded."
end