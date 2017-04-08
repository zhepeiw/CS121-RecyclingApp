Rails.application.routes.draw do
  devise_for :users

  get 'developers/index'
  get 'search/index'
  get 'welcome/index'

  resources :cities

  resources :categories

  resources :media_contents, only: [:create]

  root 'welcome#index'

  # API V1
  get 'api/v1/cities',                   action: :get_cities,              controller: 'cities_api'
  get 'api/v1/cities/:id',               action: :get_city_by_id,          controller: 'cities_api'
  get 'api/v1/cities/:id/categories',    action: :get_categories_by_id,    controller: 'cities_api'
  get 'api/v1/cities/:id/subcategories', action: :get_subcategories_by_id, controller: 'cities_api'
  get 'api/v1/cities/:id/facilities',    action: :get_facilities,          controller: 'cities_api'

end
