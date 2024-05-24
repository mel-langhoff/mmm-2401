class FoodFacade

  def self.get_total_search_results_amount(query)
    service = FoodService.new
    foods = service.get_search(query)

    foods.count
  end
end