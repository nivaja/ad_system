Rails.application.routes.draw do
  
  resources :roles
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :api do
    post "/validate/start" => "validations#start"
    post "/validate/mid" => "validations#mid"
    post "/validate/end" => "validations#end"
    resources :ads
    post "/ads/view" => "ads#view", :as => :view_ad
    post "/ads/share" => "ads#share", :as => :share_ad
    post "/user/follow" => "ads#follow", :as => :follow
    post "ads/request" => "ads#follow"
    post "ads/request/all" => "ads#view_request"
    post "ads/request/accept" => "ads#accept"
    post "ads/request/reject" => "ads#reject"
    
    get 'post/index'
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
