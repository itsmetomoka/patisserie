Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  namespace :admins do
    root 'customers#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :create,:show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
    get 'search' => 'searches#search'
  end

  root 'customers/products#top'

  get 'customers/about' => 'customers/products#about'


  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions:      'customers/sessions',
    passwords:     'customers/passwords'
    }

  scope module: :customers do

    resources :customers do
      collection do
        get 'check'
        patch 'withdrawal'
      end
    end
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :products, only: [:index, :show] do
      resources :cart_products, only: [:index, :create, :destroy, :update]
    end
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create,:index, :show]
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    get 'search' => 'searches#search'
  end


end
