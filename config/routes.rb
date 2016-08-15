Rails.application.routes.draw do
  get 'usuarios/index'

  resources :dividas
  resources :titulos
  resources :contatoprestadors
  resources :prestadors
  resources :categoriaprestadors
  resources :contabanks
  resources :grupopermissaousers
  resources :grupopermissaos
  get 'relatorio/reserva'

  resources :reservas
  resources :usercondominios
  resources :moradors
  resources :pessoas
  resources :tiporeservacondominios
  resources :tiporeservas
  resources :funcaos
  resources :apartamentos
  resources :condominios
  resources :enderecos
  resources :bairros
  resources :cidades
  resources :estados
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  get 'static_pages/home'

  get 'site/index'

  root 'static_pages#home'

 match '/listarCidade', to: 'cidades#get_cities', via: 'get'
 match '/listarBairro', to: 'bairros#get_bairros', via: 'get'
 match '/aprovarReserva', to: 'reservas#aprovar_reserva', via: 'get'
 match '/negarReserva', to: 'reservas#negar_reserva', via: 'get'
 match '/buscaTipoReservaDisponivel', to: 'tiporeservas#busca_disponivel', via: 'get'
 match '/listaPermissoes', to: 'grupopermissaousers#busca_permissoes', via: 'get'
 match '/mudaCondominio', to: 'condominios#muda_condominio', via: 'get'
 match '/validaPessoa', to: 'pessoas#valida_pessoa', via: 'get'
 get 'buscamorador' => 'moradors#busca_morador'
 get 'relatorio/reservas'
 get "/articles", to: "relatorio#index", as: :articles
 get 'buscamoradorcpf' => 'moradors#busca_moradorcpf'
 get 'buscaprestador' => 'prestadors#busca_prestador'



end
