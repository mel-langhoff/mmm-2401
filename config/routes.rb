Rails.application.routes.draw do
  root "welcome#index"

  get "foods", to: "foods#index", as: "foods"
end
