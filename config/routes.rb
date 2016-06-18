LunarShell::Engine.routes.draw do
  post :interpreter, to: 'interpreter#create'

  namespace :satellites do
    resources :passwd, only: [:update] do
      member do
        patch 'confirm', to: 'passwd#confirm'
        patch 'new', to: 'passwd#new', as: :new
      end
    end
    resources :su, only: [:update]
  end

  root 'shells#show'
end
