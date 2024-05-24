class FoodFacade

  #### this is a work in progress ####

  # tabs: MM, CGPT, G, SO

  def initialize(query)
    @query = query
  end

  # VP
  def foods
    food_data = @service.food_search(@query)

    food_data.map do |food_data|
      Food.new(format_attributes(food_data))
    end
  end

  # VP & MM
  private

  def format_attributes(attributes)
    {
      description: attributes[:description],
      brand_owner: attributes[:brandOwner],
      gtin_upc: attributes[:gtinUpc],
      ingredients: attributes[:ingredients]
    }
  end
end