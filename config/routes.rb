Cpp::Application.routes.draw do
  devise_for :users

  match "quienes-somos"   => "pages#who"         , :as => "pages_who"
  match "donde-estamos"   => "pages#where"       , :as => "pages_where"
  match "novedades"       => "pages#new_arrivals", :as => "pages_new_arrivals"
  match "nuestro-entorno" => "pages#environment" , :as => "pages_environment"
  match "botijo"          => "pages#botijo"      , :as => "pages_botijo"

  resources :categories, :path => "catalogo" do
    get 'pagina/:page', :action => :index, :on => :collection
    post 'move_lower' , :on => :member
    post 'move_higher', :on => :member
    resources :products, :path => "productos"
  end

  resources :products, :path => "productos" do
    collection do
      get 'busqueda' , :action => :search,       :as => :search
      get 'novedades', :action => :new_arrivals, :as => :new_arrivals
    end
  end

  resources :contacts, :only => [:new, :create], :path => "contacte-con-nosotros"

  resource "sitemap", :only => :show

  root :to => "pages#home"

  match "*path", :to => "pages#404"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
