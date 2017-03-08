Rails.application.routes.draw do

  get 'welcome/index'

  resources :cities

  resources :categories

  root 'welcome#index'
end
