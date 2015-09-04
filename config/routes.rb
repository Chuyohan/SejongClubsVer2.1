Rails.application.routes.draw do
   
  
  resources :borders

  get 'albums/create'
  get 'albums/update'

  root 'static_page#home'
  get    'signup'   => 'users#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#create_facebook'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # 아래 코드 순서를 바꾸면 오작동 
  get 'all_show' => 'clubs#all_show'
  get '/favorite' => 'clubs#favorite_show'
  get 'create' => 'clubs#new'
  get 'clubs/view/:id' => 'clubs#view'

  get 'clubs/edit/:id' => 'clubs#edit'
  get 'clubs/delete/:id' => 'clubs#delete'
  get "/:category" => 'clubs#category_show'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :clubs do 
     member do 
       get :club_permit
     end
   end
  resources :bookmarks
  resources :relationships, only: [:create, :destroy]
 

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
