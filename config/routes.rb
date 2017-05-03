Rails.application.routes.draw do
  
  scope module: 'api' do
		namespace :v1 do
      resources :voting_results
      resources :voting_summaries
      resources :deputies
      resources :votings
      resources :voting_tables
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
