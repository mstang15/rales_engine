Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find',             to: 'find#show'
        get 'find_all',         to: 'find#index'
        get 'random',           to: 'random#show'
        get ':id/items',        to: 'items#index'
        get ':id/invoices',     to: 'invoices#index'
      end
      resources :merchants,     only: [:index, :show]

      namespace :invoices do
        get ':id/transactions',  to: 'transactions#index'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/items',         to: 'items#index'
        get ':id/customer',      to: 'customers#show'
        get ':id/merchant',      to: 'merchants#show'
      end
      resources :invoices,      only: [:index,:show]

      namespace :invoice_items do
        get ':id/invoice',       to: 'invoices#show'
        get ':id/item',          to: 'items#show'
      end
      resources :invoice_items, only: [:index,:show]

      namespace :items do
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/merchant',      to: 'merchants#show'
      end
      resources :items,         only: [:index,:show]

      namespace :transactions do
      end
      resources :transactions,  only: [:index,:show]
    end
  end
end
