require 'rails_helper'

RSpec.describe Store, type: :model do
  
  it "should have name" do
      store = Store.new({name: nil, address: "test", email: "test@example.com", contact_person: "Tester Lester", contact_number: "09123456789"})
      expect(store).to_not be_valid
  end
  
  it "should have address" do
      store = Store.new({name: "Tester", address: nil, email: "test@example.com", contact_person: "Tester Lester", contact_number: "09123456789"})
      expect(store).to_not be_valid
  end
  
  it "should have contact number" do
      store = Store.new({name: "Tester", address: "test", email: "test@example.com", contact_person: "Tester Lester", contact_number: nil})
      expect(store).to_not be_valid
  end
  
  it "should have a valid contact number" do
      store = Store.new({name: "Tester", address: "test", email: "test@example.com", contact_person: "Tester Lester", contact_number: '0912345678912345678900'})
      expect(store).to_not be_valid
  end
  
end
