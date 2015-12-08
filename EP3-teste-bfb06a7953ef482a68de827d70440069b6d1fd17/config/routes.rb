Rails.application.routes.draw do
  get 'sessions/new'

    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'
    get    'signup'  => 'usuarios#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get 'home' => 'usuarios#index'

  resources :usuarios
    get "produtos" => "produtos#index"
    root "usuarios#index"
end
