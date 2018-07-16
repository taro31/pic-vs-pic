Rails.application.routes.draw do
 root 'pics#index'
 get 'pics' => 'pics#index'
 get 'pics/new' => 'pics#new'
 post 'pics' => 'pics#create'
end
