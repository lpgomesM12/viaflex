Rails.application.routes.draw do
  devise_for :users
  resources :serviceordemservices
  resources :productordems
  resources :services
  resources :products
  resources :serviceordems
  resources :clients
  get 'static_pages/home'
  get 'buscacliente' => 'clients#busca'
  get 'buscaproduto' => 'products#busca'
  get 'buscaservico' => 'services#busca'
  get '/relatorio/:id', to: 'serviceordems#relatorio', as: 'relatorio'
  match '/buscaProdutosServicos', to: 'productordems#busca_produto_ordem', via: 'get'
  match '/buscaServicosServicos', to: 'serviceordemservices#busca_servico_ordem', via: 'get'
  match '/addProdutoOrdem', to: 'productordems#add_produto_ordem', via: 'get'
  match '/addServicoOrdem', to: 'serviceordemservices#add_service_ordem', via: 'get'
  match '/excluiProdutoOrdem', to: 'productordems#exclui_produto_ordem', via: 'get'
  match '/excluiServicoOrdem', to: 'serviceordemservices#exclui_service_ordem', via: 'get'
  get '/agendamento' => 'serviceordems#agendamento'
  root 'clients#index'

end
