Rails.application.routes.draw do
  namespace :api do
    resources :companies

    resources :products do
      collection do
        get 'by_company/:company_id', to: 'products#by_company'
      end
    end

    resources :transactions do
      collection do
        get 'by_company/:company_id', to: 'transactions#by_company'
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
