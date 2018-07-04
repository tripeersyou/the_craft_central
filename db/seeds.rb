require 'roo'
xlsx = Roo::Excelx.new('./db/tcc_products.xlsx')
stores = Roo::Excelx.new('./db/tcc_stores.xlsx')
header = [xlsx.sheet(0).row(1), stores.sheet(0).row(1)]

if Rails.env.development? || Rails.env.test?
    if Admin.all.empty?
        puts "Seeding default Admin for development/test"
        Admin.create({first_name: 'Admin', last_name: 'Account', email:'admin@example.com', password: 'password', password_confirmation: 'password', status: true})
    else
        puts "Default Admin seeded"
    end

    if Staff.all.empty?
        puts "Seeding default Staff development/test"
        Staff.create({first_name: 'Staff', last_name: 'Account', email:'staff@example.com', password: 'password', password_confirmation: 'password'})
    else
        puts "Default Staff seeded"
    end
end

if Rails.env.production?
    if Admin.all.empty?
        puts "Seeding default Admin for production"
        Admin.create({first_name: 'Admin', last_name: 'Account', email:'admin@example.com', password: 'strawberrypie', password_confirmation: 'strawberrypie', status: true})
    else
        puts "Default Admin seeded"
    end

    if Staff.all.empty?
        puts "Seeding default Staff for production"
        Staff.create({first_name: 'Staff', last_name: 'Account', email:'staff@example.com', password: 'strawberrypie', password_confirmation: 'strawberrypie'})
    else
        puts "Default Staff seeded"
    end
end
puts ""

if Brand.all.empty?
    puts "Seeding Brands . . ."
    puts ""
    brand_names = []
    xlsx.sheet(0).each do |row|
        if !header.include? row
            brand_names << row[2]
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
            product.sku = row[0].to_s
            product.brand = Brand.find_by_name(row[2])
            product.name = row[1].to_s
            product.description = row[1].to_s
            product.price = row[4].to_f
            product.limit = 20
            product.cost = row[3].to_f
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
        if !header.include? row
            store = Store.new
            store.name = row[0]
            store.address = row[1]
            store.contact_number = row[2]
            store.save
            puts "Store #{store.name} seeded."
        end
    end
else
    puts "Stores have been seeded."
end