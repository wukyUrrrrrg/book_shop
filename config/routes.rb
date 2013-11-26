Rails.application.routes.draw do

  resources :authors, :only => [:show]
  resources :presses, :only => [:show]
  resources :product_series, :only => [:show]

  namespace :admin do
    resources :authors
    resources :presses
    resources :book_bindings
    resources :product_series
  end

end
