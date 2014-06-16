Rails.application.routes.draw do
  resources :links

  root 'links#new'

  get '/:custom', to: 'links#follow'

  #get "/foo" => redirect("http://google.com")
end
