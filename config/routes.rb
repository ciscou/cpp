Cpp::Application.routes.draw do
  scope "(:locale)", :locale => /es|en|fr/ do
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

    match "*path", :to => "pages#404"
  end

  match "/:locale", :to => "pages#home", :locale => /es|en|fr/
  root :to => "pages#home"
end
