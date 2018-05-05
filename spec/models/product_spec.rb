require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it "should have unique SKU" do
    product = Product.new({sku: "INK00319", name: "test", brand: Brand.first, description: "test", price: -9999.9, limit: 10, cost: 99999.0, inventory: 10})
    expect(product).to_not be_valid
  end
  
  it "should not have price less than 0" do
    product = Product.new({sku: "TEST001", name: "test", brand: Brand.first, description: "test", price: -9999.9, limit: 10, cost: 99999.0, inventory: 10})
    expect(product).to_not be_valid
  end
  
  it "should not have limit less than 0" do
    product = Product.new({sku: "TEST001", name: "test", brand: Brand.first, description: "test", price: -9999.9, limit: 10, cost: 99999.0, inventory: 10})
    expect(product).to_not be_valid
  end
  
  it "should not have cost less than 0" do
    product = Product.new({sku: "TEST001", name: "test", brand: Brand.first, description: "test", price: -9999.9, limit: 10, cost: 99999.0, inventory: 10})
    expect(product).to_not be_valid
  end
  
  it "should have a name" do
     product = Product.new({sku: "TEST001", name: nil, brand: Brand.first, description: "test", price: 9999.9, limit: 10, cost: 99999.0, inventory: 10})
     expect(product).to_not be_valid
  end
  
  
  
end
