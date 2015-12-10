Rails.application.routes.draw do
  get 'sessions/new'


    delete "/produtos/:id" => "produtos#destroy", as: :produto

    get 'Produtos'   => 'produtos#index'
    get "/produtos/new" => "produtos#new"
    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'
    get    'signup'  => 'usuarios#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    resources :usuarios




    get "produtos" => "produtos#index"
      get '/produtos/new' => 'produtos#new'
    root "usuarios#home"
  
   resources :produtos

end
