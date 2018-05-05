require 'rails_helper'

RSpec.describe Supplier, type: :model do
    
  it "should have name" do
      supplier = Supplier.new({name: nil, address: "test", email: "test@example.com", contact_person: "Tester Lester", contact_number: "09123456789"})
      expect(supplier).to_not be_valid
  end
  
  it "should have address" do
      supplier = Supplier.new({name: "Tester", address: nil, email: "test@example.com", contact_person: "Tester Lester", contact_number: "09123456789"})
      expect(supplier).to_not be_valid
  end
  
  it "should have contact number" do
      supplier = Supplier.new({name: "Tester", address: "test", email: "test@example.com", contact_person: "Tester Lester", contact_number: nil})
      expect(supplier).to_not be_valid
  end
  
  it "should have a valid contact number" do
      supplier = Supplier.new({name: "Tester", address: "test", email: "test@example.com", contact_person: "Tester Lester", contact_number: "091234567891234567890"})
      expect(supplier).to_not be_valid
  end 
  
end
