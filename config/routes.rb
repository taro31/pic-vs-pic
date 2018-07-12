Rails.application.routes.draw do
 get 'pics' => 'pics#index'
 get 'pics/new' => 'pics#new'
 post 'pics' => 'pics#create'
end
