class FoodsController < ApplicationController

  def index
    query = params[:query]
    service = FoodService.new
    # facade = FoodFacade.new(query)

    @total_hits = service.total_hits(query)
    @foods = service.get_search(query)
  end
end
