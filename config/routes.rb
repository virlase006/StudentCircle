StudentCircle::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :admins
   get "registrations/create"
  get "registratoins/create"
  resources :documents
get "categories/sample"
  get "users/show"
  get "users/show_follow" 
  get "users/index"
  get "user_profile/profile"
  get "assets/create"
  get "assets/destroy"
delete 'posts/:id(.:format)', :to => 'posts#destroy'

  resources :categories
    resources :activities
  resources :user_profile
  resources :assets
  resources :relationships, :only => [:create, :destroy]
 
  resources :comments
  resources :file_attachments
  root to: "static_pages#Home"

  get "static_pages/Home"
  get "static_pages/Help"
  get "post/index"
get "post/docShow"

  resources :posts do
    resources :comments
  end

  devise_for :users, :path_prefix => 'my'
    
  resources :users do
    member do
      get :following,:followers
      
    end
  end




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
