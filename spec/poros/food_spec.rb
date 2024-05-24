require 'rails_helper'

RSpec.describe Food do

  it 'exists' do
    attrs = {
      gtin_upc: "094395000172",
      description: "Cheddar Cheese",
      brand_owner: "Kraft",
      ingredients: "Cheese, cheddar, love"
    }

    food = Food.new(attrs)

    expect(food).to be_an_instance_of Food
    expect(food.description).to eq("Cheddar Cheese")
    expect(food.brand_owner).to eq("Kraft")
    expect(food.ingredients).to eq("Cheese, cheddar, love")
    expect(food.gtin_upc).to eq("094395000172")
  end
end