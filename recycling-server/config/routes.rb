Rails.application.routes.draw do
  get 'welcome/index'

  resources :cities

  root 'welcome#index'
end
