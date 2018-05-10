require 'rails_helper'

RSpec.describe Delivery, type: :model do
  
  it "should have a store id" do
    delivery = Delivery.new({store: nil, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
    delivery_product = DeliveryProduct.new({quantity: 10, product: Product.first})
    delivery.delivery_products << delivery_product
    expect(delivery).to_not be_valid
  end
  
  it "should have a valid store id" do 
    delivery = Delivery.new({store: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
    delivery_product = DeliveryProduct.new({quantity: 10, product: Product.first})
    delivery.delivery_products << delivery_product
    expect(delivery).to be_valid
  end
  
  it "should not have a total of items less than 0" do
    delivery = Delivery.new({store: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
    delivery_product = DeliveryProduct.new({quantity: 10, product: Product.first})
    delivery.delivery_products << delivery_product
    expect(delivery).to be_valid
  end
  
  it "should not have a total cost of less than 0" do
    delivery = Delivery.new({store: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
    delivery_product = DeliveryProduct.new({quantity: 10, product: Product.first})
    delivery.delivery_products << delivery_product
    expect(delivery).to be_valid
  end
  
  it "should have at least 1 product to deliver" do
    delivery = Delivery.new({store: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
    expect(delivery).to_not be_valid
  end
  
  it "should have a description" do
    delivery = Delivery.new({store: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: nil, status: true})
    delivery_product = DeliveryProduct.new({quantity: 10, product: Product.first})
    delivery.delivery_products << delivery_product
    expect(delivery).to_not be_valid
  end
  
end