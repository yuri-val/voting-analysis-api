Rails.application.routes.draw do
  
  scope module: 'api' do
		namespace :v1 do
      resources :voting_results, :voting_tables 
      
      resources :voting_summaries do
        resources :votings
      end

      resources :deputies do
        resources :voting_tables
        resources :votings do
          resources :voting_tables
        end
      end 

      resources :votings do
        resources :voting_tables
      end  
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
