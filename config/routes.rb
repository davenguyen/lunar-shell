LunarShell::Engine.routes.draw do
  namespace :satellites do
    resource :exit, only: []

    resource :help, only: []

    resource :passwd, only: [:create] do
      post 'confirm_password'
      post 'new_password'
    end

    resource :quit, only: []

    resource :su, only: [:create]

    post '*error', to: 'satellites#error'
    post :run
  end

  root 'shells#show'
end
