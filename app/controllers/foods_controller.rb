class FoodsController < ApplicationController
  require 'net/http'
  require 'json'

  # this goes in the service, facade, and poros; refer to viewingparty proj
  def index
    query = params[:q]
    if query.present?
      api_key = Rails.application.credentials.api_key # Ensure you store your API key securely
      encoded_query = URI.encode_www_form_component(query)
      url = URI("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{api_key}&query=#{encoded_query}")
      response = Net::HTTP.get(url)
      @results = JSON.parse(response)["foods"]
    else
      @results = []
    end
  end
end
