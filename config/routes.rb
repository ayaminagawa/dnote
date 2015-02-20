Dnote::Application.routes.draw do

  get "create/destroy"
  get "create/show"
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    :passwords => "users/passwords",
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
  }

  
 
  get "made_report/new"
  get "made_report/create"
  get "made_report/destroy"
  get "made_report/show"
  resources :menus



  get "menu/new"
  get "menu/create"
  get "menu/destroy"
  root  'about#index'
  match '/about', to:'about#index', via:'get'

  get "column/index"
  get "about/index"

  resources :recipes
  resources :users
  resources :menu_recipes
  resources :made_reports

  get '/vagetables', to:'recipes#vagetables'
  get '/meets', to:'recipes#meets'
  get '/fishes', to:'recipes#fishes'
  get '/rices', to:'recipes#rices'
  get '/pastas', to:'recipes#pastas'
  get '/noodles', to:'recipes#noodles'
  get '/salads', to:'recipes#salads'
  get '/soups', to:'recipes#soups'
  get '/boxes', to:'recipes#boxes'

  get '/calories', to:'recipes#calories'
  get '/sugars', to:'recipes#sugars'
  get '/stabilities', to:'recipes#stabilities'
  get '/goodtastes', to:'recipes#goodtastes'
  get '/easies', to:'recipes#easies'

  get "made_report/new"
  get "made_report/create"
  get "made_report/destroy"





  
  
  # devise_for :users, :controllers => {
  # :sessions      => "users/sessions",
  # :registrations => "users/registrations",
  # :passwords     => "users/passwords",
  # :omniauth_callbacks => "users/omniauth_callbacks" 
  # }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
