require 'test_helper'

class AgendamentomudancasControllerTest < ActionController::TestCase
  setup do
    @agendamentomudanca = agendamentomudancas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agendamentomudancas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agendamentomudanca" do
    assert_difference('Agendamentomudanca.count') do
      post :create, agendamentomudanca: { apartamento_id: @agendamentomudanca.apartamento_id, condominio_id: @agendamentomudanca.condominio_id, data_agendamento: @agendamentomudanca.data_agendamento, flag_entrada: @agendamentomudanca.flag_entrada, flag_saida: @agendamentomudanca.flag_saida, fone: @agendamentomudanca.fone, nome: @agendamentomudanca.nome, observacao: @agendamentomudanca.observacao, periodo: @agendamentomudanca.periodo, valr_taxa: @agendamentomudanca.valr_taxa }
    end

    assert_redirected_to agendamentomudanca_path(assigns(:agendamentomudanca))
  end

  test "should show agendamentomudanca" do
    get :show, id: @agendamentomudanca
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agendamentomudanca
    assert_response :success
  end

  test "should update agendamentomudanca" do
    patch :update, id: @agendamentomudanca, agendamentomudanca: { apartamento_id: @agendamentomudanca.apartamento_id, condominio_id: @agendamentomudanca.condominio_id, data_agendamento: @agendamentomudanca.data_agendamento, flag_entrada: @agendamentomudanca.flag_entrada, flag_saida: @agendamentomudanca.flag_saida, fone: @agendamentomudanca.fone, nome: @agendamentomudanca.nome, observacao: @agendamentomudanca.observacao, periodo: @agendamentomudanca.periodo, valr_taxa: @agendamentomudanca.valr_taxa }
    assert_redirected_to agendamentomudanca_path(assigns(:agendamentomudanca))
  end

  test "should destroy agendamentomudanca" do
    assert_difference('Agendamentomudanca.count', -1) do
      delete :destroy, id: @agendamentomudanca
    end

    assert_redirected_to agendamentomudancas_path
  end
end
