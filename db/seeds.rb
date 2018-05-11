require 'roo'
xlsx = Roo::Excelx.new('./db/products.xlsx')
stores = Roo::Excelx.new('./db/stores.xlsx')
header = [xlsx.sheet(0).row(1),xlsx.sheet(0).row(2)]

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


if Rails.env.development?
    puts ""
    puts "Seeding Fake Data . . ."
    puts ""
    puts "Seeding Store Products"
    puts ""

    Store.all.each do |store|
        30.times do
            store_product = StoreProduct.new
            store_product.product = Product.all.sample
            store_product.inventory = rand(1..100)
            store.store_products << store_product
            store.save
            puts "Store Product ##{store_product.id}: #{store_product.product.name} has been seeded to #{store.name}"
        end
    end

    puts ""
    puts "Seeding Store Deliveries"
    puts ""

    while(Delivery.all.count < 200) do
        delivery = Delivery.new
        date = Faker::Time.between(3.year.ago, Date.today)
        delivery.store = Store.all.sample
        delivery.status = true
        delivery.description = Populator.sentences(1)
        delivery.created_at = date
        delivery.updated_at = date
        15.times do 
            product = Product.all.sample
            quantity = rand(1 .. product.limit)
            delivery_product = DeliveryProduct.new
            delivery_product.product = product
            delivery_product.quantity = quantity
            delivery_product.cost = quantity * product.cost
            delivery_product.price = quantity * product.price
            delivery_product.created_at = date
            delivery_product.updated_at = date
            delivery.delivery_products << delivery_product
        end
        delivery.total_items = delivery.items
        delivery.total_cost = delivery.cost
        delivery.total_price = delivery.price
        if delivery.save
            puts "Delivery ##{delivery.id} to #{delivery.store.name} with a total price of #{delivery.total_price} has been seeded."
        end
    end

    puts ""
    puts "Seeding Store Pullouts"
    puts ""

    while(Pullout.all.count < 200) do
        pullout = Pullout.new
        date = Faker::Time.between(3.year.ago, Date.today)
        pullout.store = Store.all.sample
        pullout.description = Populator.sentences(1)
        pullout.created_at = date
        pullout.updated_at = date
        15.times do 
            product = Product.all.sample
            quantity = rand(1 .. product.limit)
            pullout_product = PulloutProduct.new
            pullout_product.product = product
            pullout_product.quantity = quantity
            pullout_product.cost = quantity * product.cost
            pullout_product.price = quantity * product.price
            pullout_product.created_at = date
            pullout_product.updated_at = date
            pullout.pullout_products << pullout_product
        end
        pullout.total_items = pullout.items
        pullout.total_cost = pullout.cost
        pullout.total_price = pullout.price
        if pullout.save
            puts "Pullout ##{pullout.id} to #{pullout.store.name} with a total price of #{pullout.total_price} has been seeded."
        end
    end

    puts ""
    puts "Seeding Store EndingInventories"
    puts ""

    while(EndingInventory.all.count < 200) do
        ending_inventory = EndingInventory.new
        date = Faker::Time.between(3.year.ago, Date.today)
        ending_inventory.store = Store.all.sample
        ending_inventory.created_at = date
        ending_inventory.updated_at = date
        6.times do
            ending_inventory_product = EndingInventoryProduct.new
            product = ending_inventory.store.products.sample
            b_product = StoreProduct.where('store_id = ? AND product_id = ?', ending_inventory.store.id, product.id).first        
            b_inventory = b_product.inventory
            ending_inventory_product.product = product
            ending_inventory_product.beginning_quantity = b_inventory
            ending_inventory_product.ending_quantity = rand(0 .. b_inventory)
            b_product.inventory = ending_inventory_product.ending_inventory
            b_product.save
            ending_inventory_product.price = product.price
            ending_inventory_product.cost = product.cost
            ending_inventory_product.created_at = date
            ending_inventory_product.updated_at = date
            ending_inventory.ending_inventory_products << ending_inventory_product
        end
        ending_inventory.cogs = ending_inventory.total_cogs
        ending_inventory.sales = ending_inventory.total_sales
        if ending_inventory.save
            puts "Ending Inventory ##{ending_inventory.id} to #{ending_inventory.store.name} with a total sales of #{ending_inventory.sales} has been seeded."
        end
    end
end