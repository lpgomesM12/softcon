require 'test_helper'

class PessoaautorizadasControllerTest < ActionController::TestCase
  setup do
    @pessoaautorizada = pessoaautorizadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoaautorizadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoaautorizada" do
    assert_difference('Pessoaautorizada.count') do
      post :create, pessoaautorizada: { condominio_id: @pessoaautorizada.condominio_id, data_nessadata: @pessoaautorizada.data_nessadata, data_periodofim: @pessoaautorizada.data_periodofim, data_periodoinicio: @pessoaautorizada.data_periodoinicio, desc_atribuicao: @pessoaautorizada.desc_atribuicao, flag_domingo: @pessoaautorizada.flag_domingo, flag_nestadata: @pessoaautorizada.flag_nestadata, flag_periodo: @pessoaautorizada.flag_periodo, flag_pessoaautorizada: @pessoaautorizada.flag_pessoaautorizada, flag_pessoabloqueada: @pessoaautorizada.flag_pessoabloqueada, flag_quarta: @pessoaautorizada.flag_quarta, flag_quinta: @pessoaautorizada.flag_quinta, flag_sabado: @pessoaautorizada.flag_sabado, flag_segunda: @pessoaautorizada.flag_segunda, flag_sexta: @pessoaautorizada.flag_sexta, flag_terca: @pessoaautorizada.flag_terca, flag_todasemana: @pessoaautorizada.flag_todasemana, identificacao_id: @pessoaautorizada.identificacao_id, numr_horafim: @pessoaautorizada.numr_horafim, numr_horainicio: @pessoaautorizada.numr_horainicio }
    end

    assert_redirected_to pessoaautorizada_path(assigns(:pessoaautorizada))
  end

  test "should show pessoaautorizada" do
    get :show, id: @pessoaautorizada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pessoaautorizada
    assert_response :success
  end

  test "should update pessoaautorizada" do
    patch :update, id: @pessoaautorizada, pessoaautorizada: { condominio_id: @pessoaautorizada.condominio_id, data_nessadata: @pessoaautorizada.data_nessadata, data_periodofim: @pessoaautorizada.data_periodofim, data_periodoinicio: @pessoaautorizada.data_periodoinicio, desc_atribuicao: @pessoaautorizada.desc_atribuicao, flag_domingo: @pessoaautorizada.flag_domingo, flag_nestadata: @pessoaautorizada.flag_nestadata, flag_periodo: @pessoaautorizada.flag_periodo, flag_pessoaautorizada: @pessoaautorizada.flag_pessoaautorizada, flag_pessoabloqueada: @pessoaautorizada.flag_pessoabloqueada, flag_quarta: @pessoaautorizada.flag_quarta, flag_quinta: @pessoaautorizada.flag_quinta, flag_sabado: @pessoaautorizada.flag_sabado, flag_segunda: @pessoaautorizada.flag_segunda, flag_sexta: @pessoaautorizada.flag_sexta, flag_terca: @pessoaautorizada.flag_terca, flag_todasemana: @pessoaautorizada.flag_todasemana, identificacao_id: @pessoaautorizada.identificacao_id, numr_horafim: @pessoaautorizada.numr_horafim, numr_horainicio: @pessoaautorizada.numr_horainicio }
    assert_redirected_to pessoaautorizada_path(assigns(:pessoaautorizada))
  end

  test "should destroy pessoaautorizada" do
    assert_difference('Pessoaautorizada.count', -1) do
      delete :destroy, id: @pessoaautorizada
    end

    assert_redirected_to pessoaautorizadas_path
  end
end
