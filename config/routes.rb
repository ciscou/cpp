Cpp::Application.routes.draw do
  scope "(/:locale)", :locale => /es|en|fr/ do
    devise_for :users, controllers: { sessions: :sessions, registrations: :registrations }

    get "quienes-somos"   => "pages#who"         , :as => "pages_who"
    get "como-trabajamos" => "pages#how_we_work" , :as => "pages_how_we_work"
    get "donde-estamos"   => "pages#where"       , :as => "pages_where"
    get "nuestro-entorno" => "pages#environment" , :as => "pages_environment"
    get "botijo"          => "pages#botijo"      , :as => "pages_botijo"
    get "maceta"          => "pages#pot"         , :as => "pages_pot"

    resources :categories, only: [:index, :new, :edit, :create, :update, :destroy], :path => "catalogo" do
      get 'pagina/:page', :action => :index, :on => :collection
      post 'move_lower' , :on => :member
      post 'move_higher', :on => :member
      resources :products, :path => "productos"
    end

    resources :products, only: [], :path => "productos" do
      collection do
        get 'busqueda' , :action => :search,       :as => :search
        get 'novedades', :action => :new_arrivals, :as => :new_arrivals
      end
    end

    resources :contacts, :only => [:new, :create], :path => "contacte-con-nosotros"
  end

  resource "sitemap", :only => :show

  get "/:locale", :to => "pages#home", :as => :localized_root, :locale => /es|en|fr/

  get "/:locale/*path", :to => "pages#error_404", :locale => /es|en|fr/
  get "*path", :to => "pages#error_404"

  root :to => "pages#home"
end
