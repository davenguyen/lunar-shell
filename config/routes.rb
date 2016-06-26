LunarShell::Engine.routes.draw do
  namespace :satellites do
    resource :clear, only: []
    resource :exit, only: []
    resource :help, only: []
    resource :history, only: []
    resource :passwd, only: [:create] do
      post 'confirm_password'
      post 'new_password'
    end
    resource :quit, only: []
    resource :su, only: [:create]

    # catch all
    post '*error', action: 'run'
    post :run
  end

  root 'shells#show'
end
