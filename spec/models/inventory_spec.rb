require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @user.save
  end

  it 'is valid' do
    inventory = Inventory.new(name: 'inv1', description: 'test', user_id: @user.id)
    expect(inventory).to be_valid
  end

  it 'not valid without a name' do
    inventory = Inventory.new(description: 'test', user_id: @user.id)
    expect(inventory).to_not be_valid
  end

  it 'not valid without a description' do
    inventory = Inventory.new(name: 'inv1', user_id: @user.id)
    expect(inventory).to_not be_valid
  end
end
