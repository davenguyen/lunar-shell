LunarShell::Engine.routes.draw do
  post :interpreter, to: 'interpreter#create'
  resources :users, only: [:update]
  root 'shells#show'
end
