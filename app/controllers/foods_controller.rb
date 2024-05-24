class FoodsController < ApplicationController

  def index
    query = params[:query]
    service = FoodService.new

    @total_hits = service.total_hits(query)
    @foods = service.get_search.limit(10)
  end
end
