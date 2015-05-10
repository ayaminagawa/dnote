Dnote::Application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "contacts/new"
  post "contacts/create"
  get "nutritionists/index"
  get 'nutritionists/show/:id' => 'nutritionists#show'
  get 'columns/show/:id' => 'columns#show'
  get "column/new"
  get "column/create"
  get "column/destroy"
  get "column/update"
  get "column/index"
  resources :columns
  
  devise_for :nutritionists, controllers: {
   :sessions => "nutritionists/sessions",
   :registrations => "nutritionists/registrations"
 }
 
 devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks",
  :passwords => "users/passwords",
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
}

resources :menus

get "menu/new"
get "menu/create"
get "menu/destroy"
root  'about#index'
match '/about', to:'about#index', via:'get'
get "company", to: "about#company"
get "security_information", to: "about#security_information"
get "privacy_policy", to: "about#privacy_policy"

get "about/index"

resources :recipes do
  resource :made_reports
end
resources :users
resources :menu_recipes
resources :ingredients

get '/kinds', to:'recipes#recipe_kinds'
get '/categories', to:'recipes#recipe_categories'
get '/calories', to:'recipes#calories'

get "made_report/new"
get "made_report/create"
get "made_report/destroy"
resources :favorites, only: [:create, :destroy]

get '/menu_recipes', to:'menus#menu_recipes'
 resources :nutritionists

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
