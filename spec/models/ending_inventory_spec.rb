require 'rails_helper'

RSpec.describe EndingInventory, type: :model do
  
  it "should have a store id" do
    ending_inventory = EndingInventory.new({store_id: nil, sales: 99999.0, cogs: 9999.0})
    expect(ending_inventory).to_not be_valid
  end
  
  
end
