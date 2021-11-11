Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('api-docs/index.html')
  namespace :api do
    namespace :admin do
      resources :users, only: [:index]
      resources :products do
        collection do
          get :show_items_price
        end
      end
    end
  end
end
