Rails.application.routes.draw do
  resources :articles do
    get '/graph' => "articles#graph", :on => :collection
    get '/simple' => "articles#simple", :on => :collection
  end
  resources :groups
end
