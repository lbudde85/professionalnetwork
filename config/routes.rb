Rails.application.routes.draw do
  devise_for :users, :skip => [:sessions]

  as :user do
    post "/users/sign_in" => "devise/sessions#create", :as => :user_session
    delete "/users/sign_out"  => "devise/sessions#destroy", as: :destroy_user_session
  end

  namespace :agent do
    get '', to: "dashboard#index"
    get '/profile', to: "profile#edit"
    put '/profile', to: "profile#update"
    patch '/profile', to: "profile#update"
    get '/search', to: "search#index"
  end

  namespace :brand do
    get '', to: "dashboard#index"
    get '/profile', to: "profile#edit"
    put '/profile', to: "profile#update"
    patch '/profile', to: "profile#update"
    get '/search', to: "search#index"

    get 'jobs/new', to: "job_posts#new"
    get 'jobs', to: "job_posts#index"
    post 'jobs', to: "job_posts#create"
    delete 'jobs/:id', to: "job_posts#destroy"
  end

  namespace :distributor do
    get '', to: "dashboard#index"
    get '/profile', to: "profile#edit"
    put '/profile', to: "profile#update"
    patch '/profile', to: "profile#update"
    get '/search', to: "search#index"
  end

  root to: "welcome#index"
end
