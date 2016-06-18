LunarShell::Engine.routes.draw do
  resources :passwd, only: [:update] do
    member do
      patch 'confirm', to: 'passwd#confirm'
      patch 'new', to: 'passwd#new', as: :new
    end
  end
  post :interpreter, to: 'interpreter#create'
  root 'shells#show'
end
