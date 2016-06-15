LunarShell::Engine.routes.draw do
  post :interpreter, to: 'interpreter#create'
  root 'shells#show'
end
