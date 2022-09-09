require 'rails_helper'

describe Food do
  create_food = Food.new(name: 'mango', measurement_unit: 'kilograms', price: 10)
  subject { create_food }

  before { subject.save }

  it 'name should not be blank' do
    subject.name = 'mango'
    expect(subject.name).to eq 'mango'
  end
  it 'measurement_unit field should not be blank' do
    subject.measurement_unit = 'kilograms'
    expect(subject.measurement_unit).to eq 'kilograms'
  end

  it 'price must be an integer greater than or equal to 0' do
    subject.price = 3
    expect(subject.price).to be >= 0
  end
end
