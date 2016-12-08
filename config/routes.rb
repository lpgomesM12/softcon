Rails.application.routes.draw do

  resources :turnos
  resources :produtos
  resources :empresas
  resources :murals
  resources :pessoaautorizadas
  get 'relmudanca/relatorio'

  resources :agendamentomudancas
  resources :achadoperdidos
  resources :inadimplentes
  get 'relatoriodespesa/relatorio'

  get 'relatorioacesso/relatorio'

  resources :despesas
  resources :tipoocorrencia
  resources :ocorrencia do
    member do
      get :baixa_ocorrencia
    end
  end
  resources :identificacaos
  resources :encomendas
  resources :termos
  resources :tipotermos
  root 'static_pages#home'

  #get 'usuarios/index'
  resources :usuarios
  resources :dividas
  resources :titulos
  resources :contatoprestadors
  resources :prestadors
  resources :categoriaprestadors
  resources :contabanks
  resources :grupopermissaousers
  resources :grupopermissaos
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

  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/listarBairro', to: 'bairros#get_bairros', via: 'get'
  match '/aprovarReserva', to: 'reservas#aprovar_reserva', via: 'get'
  match '/negarReserva', to: 'reservas#negar_reserva', via: 'get'
  match '/buscaTipoReservaDisponivel', to: 'tiporeservas#busca_disponivel', via: 'get'
  match '/listaPermissoes', to: 'grupopermissaousers#busca_permissoes', via: 'get'
  match '/mudaCondominio', to: 'condominios#muda_condominio', via: 'get'
  match '/validaPessoa', to: 'pessoas#valida_pessoa', via: 'get'
  match '/incluirDivida', to: 'dividas#incluir_divida', via: 'get'
  match '/alterarDivida', to: 'dividas#alterar_divida', via: 'get'
  match '/entregaEncomenda', to: 'encomendas#entrega_encomenda', via: 'get'
  match '/buscaDespesas', to: 'dividas#busca_despesas', via: 'get'
  match '/buscaIdentificacao', to: 'ocorrencia#busca_identificacao', via: 'get'
  match '/baixaocorrencia/:id', to: 'ocorrencia#baixa_ocorrencia', via: 'get'
  match '/excluirdivida', to: 'dividas#excluir_divida', via: 'get'
  match '/buscadivida', to: 'dividas#busca_divida', via: 'get'
  match '/incluirInadimplente', to: 'inadimplentes#incluir', via: 'get'
  match '/validaInadiplente', to: 'inadimplentes#valida_inadiplente', via: 'get'
  match '/pessoasautorizadas', to: 'pessoaautorizadas#pessoas_autorizadas', via: 'get'
  match '/entregaTurno', to: 'turnos#entrega_turno', via: 'get'

  get '/ocorrencia/:id', to: 'ocorrencia#baixa_ocorrencia', as: 'baicaocorrencia'

  get 'buscamorador' => 'moradors#busca_morador'
  get 'buscaapartamento' => 'apartamentos#busca'
  get 'relatorio/reservas'
  get "/articles", to: "relatorio#index", as: :articles
  get 'buscamoradorcpf' => 'moradors#busca_moradorcpf'
  get 'buscaprestador' => 'prestadors#busca_prestador'
  get 'static_pages/home'
  get 'site/index'
  get "/relatorioreserva", to: "relatorio#reservas", as: :relatorioreserva
  get "/termoachado", to: "achadoperdidos#relatoriotermo", as: :termoachado
  get "/relmudanca", to: "agendamentomudancas#relmudanca", as: :relmudanca
  get 'muraluser' => 'murals#mural'
  get '/livroocorrencia/:id', to: 'turnos#relatorio', as: :livroocorrencia
  get 'site/about'
  get 'site/contato'
  get 'site/servico'

end
