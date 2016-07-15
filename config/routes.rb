Rails.application.routes.draw do
  resources :tiporeservacondominios
  resources :tiporeservas
  resources :funcaos
  resources :apartamentos
  resources :condominios
  resources :enderecos
  resources :bairros
  resources :cidades
  resources :estados
  devise_for :users
  get 'static_pages/home'

  get 'site/index'

  root 'static_pages#home'

end


