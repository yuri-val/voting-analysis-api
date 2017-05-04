Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do
      resources :voting_results, :voting_rows, only: [:index, :show]

      resources :voting_summaries, only: [:index, :show] do
        resources :votings, only: [:index, :show]
      end

      resources :deputies, only: [:index, :show] do
        resources :zones, only: [:index]
        resources :voting_rows, only: [:index, :show]
        resources :votings, only: [:index, :show] do
          resources :voting_rows, only: [:index, :show]
        end
      end

      resources :votings, only: [:index, :show] do
        resources :voting_rows, only: [:index, :show]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
