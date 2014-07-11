MicroEnterpriseService::Application.routes.draw do

  require 'api'  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :except => [:index,:new] do
    collection do
      get :call_rss_service
      get :enterprise
    end
  end

  resources :products do
    collection do
      match "search" => "products#search", :via => :post
    end
  end

  resources :technologies do
    collection do
      match "search" => "technologies#search", :via => :post
    end
  end

  resources :enterprises do
    collection do
      match "search" => "enterprises#search", :via => :post
    end
  end
  resource :enterprise, :except => [] do
    collection do
      match ":id/products" => "enterprises#products", :via => :get, :as => :products
    end
  end

  get 'tags/:tag', to: 'tags#show', as: :tag

  resources :dashboard, :only => [:index]
  resources :domains, :except => [:edit,:new]
  resource :domain, :except => [] do
    collection do
      match "(:id)/posts" => "domains#posts", :via => :get, :as => :posts
    end
  end

  resources :rsses, :except => [:index, :edit,:new]  do
    collection do
      get :domains
      get :industries
      get :grab_from
    end
  end
  
  resources :industries, :except => [:edit,:new]
  resource :industry, :except => [] do
    collection do
      match "(:id)/posts" => "industries#posts", :via => :get, :as => :posts
      match "(:id)/enterprises" => "industries#enterprises", :via => :get, :as => :enterprises
      match "(:id)/products" => "industries#products", :via => :get, :as => :products
    end
  end
 
  resources :posts, :except => :index do
    collection do
      match "search" => "posts#search", :via => :post
    end
  end
  
  match 'tools/express' => 'tools#express', :via => :get
  match 'tools/patent' => 'tools#patent', :via => :get

  root :to => 'dashboard#index'
  mount MicroEnterpriseService::API => '/'
  mount Ckeditor::Engine => '/ckeditor'

  match '/:anything', to: 'application#routing_error', as: :error, :constraints => {:anything => /.*/} ,:via => [:get , :post]
end
