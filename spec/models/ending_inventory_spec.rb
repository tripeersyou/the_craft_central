require 'rails_helper'

RSpec.describe EndingInventory, type: :model do
  
  it "should have at least one product entry" do
    ending_inventory = EndingInventory.new({store: Store.first, sales: 99999.0, cogs: 9999.0})
    expect(ending_inventory).to_not be_valid
  end 
  
  it "should have a store id" do
    ending_inventory = EndingInventory.new({store_id: nil, sales: 99999.0, cogs: 9999.0})
    expect(ending_inventory).to_not be_valid
  end
  
  it "should not have cogs less than 0" do
    ending_inventory = EndingInventory.new({store: Store.first, sales: 99999.0, cogs: -9999.0})
    expect(ending_inventory).to_not be_valid
  end
  
  it "should not have sales less than 0" do
    ending_inventory = EndingInventory.new({store: Store.first, sales: -99999.0, cogs: 9999.0})
    expect(ending_inventory).to_not be_valid
  end
  
end
