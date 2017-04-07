Rails.application.routes.draw do
  namespace :admin do
    get 'analyzer/products_company'
    get 'analyzer/products_category'
    get 'analyzer/products_date'
    get 'analyzer/products_by_expiry_date'
  end

  get 'admin/index', to: 'application#index'
  get 'calendar/index'
  get 'calendar/show'

  resources :expiry_dates
  namespace :admin do
    resources :products
  end



  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#index'

  namespace :admin do
    resources :categories, :subcategories, :companies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
