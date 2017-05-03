Rails.application.routes.draw do
  get 'catalog/index'
  get 'catalog/show/:id', to: 'catalog#show', as: 'catalog_show'
  get 'catalog/search'
  get 'catalog/news'

  get 'expiry_dates/product_decrese_count'
  post 'expiry_dates/product_change_count'


  namespace :admin do
    get 'analyzer/products_company'
    get 'analyzer/products_category'
    get 'analyzer/products_date'
    get 'analyzer/products_by_expiry_date'
    get 'analyzer/products_in_period'
    get 'analyzer/products_after_period'
    get 'products/product_set_discount'
    post 'products/set_discount'
    get 'products/search', to: 'products#search'

    get 'products/new_company'
    get 'products/new_category'
    get 'products/new_sub_category'
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
