Rails.application.routes.draw do
  get    "/sign-up",                 to: "users#index",           as: :sign_up
  post   "/users",                   to: "users#create"
  get    "/user-photos",             to: "users#user_photos",     as: :user_photos
  get    "/users/edit/:id",          to: "users#edit",            as: :user
  patch "/users/edit/:id",           to: "users#update"


  get    "/sign-out",                to: "sessions#sign_out",     as: :sign_out
  post   "/sign-in",                 to: "sessions#sign_in",      as: :sign_in

  post   "/photos/rating/:id",       to: "ratings#create",        as: :rating
  get    "/photos/rating",           to: "ratings#review_images", as: :review_images

  get    "/",                        to: "photos#index",          as: :home
  post   "/new-photo",               to: "photos#new",            as: :photos
  get    "/add-photo",               to: "photos#add_a_photo",    as: :add_a_photo
  get    "/photos",                  to: "photos#show",           as: :show_photos
  get    "/photos/:id",              to: "photos#single_photo",   as: :single_photo
  delete "/photos/:id",              to: "photos#delete",         as: :delete_photo
  get    "/random-photo",            to: "photos#random",         as: :random_photo


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
