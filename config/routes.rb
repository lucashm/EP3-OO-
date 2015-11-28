Rails.application.routes.draw do
  resources :usuarios
    get "produtos" => "produtos#index"
    root "usuarios#index"
end
