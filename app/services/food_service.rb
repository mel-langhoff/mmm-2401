class FoodService
  def conn
    Faraday.new(url: 'https://api.nal.usda.gov/fdc/') do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.food_data[:api_key]
    end
  end

  # "v1/sdlkjds"
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_search(query)
    # replaces each space with %20
    query = query.gsub(" ", "%20")
    response = get_url("v1/foods/search?#{query}&maxItems=10")

    foods = response[:foods]
    foods.take(10)
    # only the first 10 elements of the foods array are returned
  end

  def total_hits(query)
    query = query.gsub(" ", "%20")
    response = get_url("v1/foods/search?#{query}&maxItems=10")

    response[:totalHits]
  end
end