Rails.application.routes.draw do
  resources :usuarios
    get "produtos" => "produtos#index"
end
