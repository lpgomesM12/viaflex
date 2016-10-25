Rails.application.routes.draw do
  resources :serviceordems
  resources :clients
  get 'static_pages/home'
  get 'buscacliente' => 'clients#busca'
  get '/relatorio/:id', to: 'serviceordems#relatorio', as: 'relatorio'

  root 'static_pages#home'
end
