Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  devise_for :admins
  devise_scope :admin do
    authenticated :admin do
      root 'products#index', as: :admin_root
      resources :products, except: [:destroy]
      resources :suppliers, except: [:destroy] do
        resources :orders, except: [:destroy, :update, :edit]
      end
      resources :stores, except: [:destroy] do
        resources :deliveries, except: [:destroy, :edit]
        resources :pullouts, except: [:destroy, :edit, :update]
        resources :transfers, except: [:destroy, :edit, :update]
        resources :ending_inventories, except: [:destroy]
      end
    end
  end

  root 'devise/sessions#new'

  devise_for :staffs, skip: [:registration, :passwords]
  devise_scope :staff do
    authenticated :staff do
      root 'products#index', as: :staff_root
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
    end
  end
  
  visualize

end
