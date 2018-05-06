require 'rails_helper'

RSpec.describe Delivery, type: :model do
  
  it "should have a supplier id" do
    delivery = Delivery.new({store_id: nil, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
    expect(delivery).to_not be_valid
  end
  
#   it "should have a valid supplier id" do
#     delivery = Delivery.new({store_id: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
#     expect(delivery).to be_valid
#   end
  
#   it "should not have a total of items less than 0" do
#     delivery = Delivery.new({store_id: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
#     expect(delivery).to_not be_valid
#   end
  
#   it "should not have a total cost of less than 0" do
#     delivery = Delivery.new({store_id: Store.first, total_items: 10, total_cost: 99999.0, total_price: 9999.0, description: "test", status: true})
#     expect(delivery).to_not be_valid
#   end
  
end