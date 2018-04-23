Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  devise_for :staffs, skip: [:registration, :passwords]
  devise_scope :staff do
    authenticated :staff do
      root 'pages#dashboard', as: :staff_root
      get 'account', to: 'pages#account'
      resources :products, only: [:show, :index]
      resources :suppliers, only: [:show, :index] do
        resources :orders, only: [:show, :index]
      end
      resources :stores, only: [:show, :index] do
        resources :deliveries, only: [:show, :index]
        resources :pullouts, only: [:show, :index]
        resources :transfers, only: [:show, :index]
        resources :ending_inventories, only: [:show, :index]
      end
      resources :forms, only: [:index] do
        collection do
          get 'products', to: 'forms#products', as: 'form_products'
          get 'store_products', to: 'forms#store_products', as: 'form_store_products'
        end
      end
    end
  end

  devise_for :admins
  devise_scope :admin do
    authenticated :admin do
      root 'pages#dashboard', as: :admin_root
      get 'account', to: 'pages#account', as: 'accounts'
      resources :products, except: [:destroy]
      resources :suppliers, except: [:destroy] do
        resources :orders, except: [:destroy, :update, :edit, :index]
      end
      resources :stores, except: [:destroy] do
        resources :deliveries, except: [:destroy, :edit, :index]
        resources :pullouts, except: [:destroy, :edit, :update, :index]
        resources :transfers, except: [:destroy, :edit, :update, :index]
        resources :ending_inventories, except: [:destroy, :index, :edit, :update]
      end
      resources :manage_accounts, only: [:index]
      resources :staffs, except: [:index, :show]
      resources :admins, only: [:update, :destroy]
      resources :forms, only: [:index] do
        collection do
          get 'products', to: 'forms#products'
          get 'store_products', to: 'forms#store_products'
        end
      end
      resources :api, only: [] do
        collection do 
          get 'product', to: 'api#products'
          get 'store_product', to: 'api#store_products'
        end
      end
    end
  end

  root 'devise/sessions#new'

end
