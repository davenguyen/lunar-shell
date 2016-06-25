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
  end
  post 'satellites/*error', to: 'satellites#error'

  root 'shells#show'
end
