require 'rails_helper'

RSpec.describe FoodService do
  it "#conn" do
  service = FoodService.new
  connection = service.conn

  expect(connection).to be_an_instance_of Faraday::Connection
  expect(connection.params["api_key"]).to eq(Rails.application.credentials.food_data[:api_key])
end

  it "#get_url" do
    service = FoodService.new

    VCR.use_cassette("ched_chz_search") do
      url = "v1/foods/search?api_key=DEMO_KEY&query=Cheddar%20Cheese"
      parsed_json = service.get_url(url)

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:foods]).to be_a Array
    end
  end

  it "#get_search" do
    service = FoodService.new

    VCR.use_cassette("ched_chz_search_2") do
      foods = service.get_search("cheddar")

      expect(foods).to be_an(Array)
      expect(foods).not_to be_empty

      food = foods.first
      expect(food).to include(:description)
    end
  end

  it "#total_hits" do
    service = FoodService.new

    VCR.use_cassette("ched_chz_search_3") do
      total_results = service.total_hits("cheese")

      expect(total_results).to eq 467104
    end
  end 
end
