Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :educations
  resources :experiences
  resources :sessions
  resources :skills
  resources :capstones

  get "/students" => "students#index"
  get "students/:id" => "students#show"
  post "/students" => "students#create"
  patch "/students/:id" => "students#update"
  delete "/students/:id" => "students#destroy"

  get "/studentskills" => "studentskills#index"
  get "studentskills/:id" => "studentskills#show"
  post "/studentskills" => "studentskills#create"
  patch "/studentskills/:id" => "studentskills#update"
  delete "/studentskills/:id" => "studentskills#destroy"

  get "/skills" => "skills#index"
  get "/skills" => "skills#show"
  post "/skills" => "skills#create"
  patch "/skills/:id" => "skills#update"
  delete "/skills/:id" => "skills#destroy"
end
