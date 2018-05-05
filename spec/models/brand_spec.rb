require 'rails_helper'

RSpec.describe Brand, type: :model do
  
  it "should have name" do
    brand = Brand.new({name: nil})
    expect(brand).to_not be_valid
  end
  
end
