require 'test_helper'

class ReservasControllerTest < ActionController::TestCase
  setup do
    @reserva = reservas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserva" do
    assert_difference('Reserva.count') do
      post :create, reserva: { apartamento_id: @reserva.apartamento_id, condominio_id: @reserva.condominio_id, data_autorizacao: @reserva.data_autorizacao, data_cancelamento: @reserva.data_cancelamento, data_reserva: @reserva.data_reserva, email_solicitante: @reserva.email_solicitante, flag_autorizado: @reserva.flag_autorizado, hora_fim: @reserva.hora_fim, hora_inicio: @reserva.hora_inicio, nome_solicitante: @reserva.nome_solicitante, tiporeserva_id: @reserva.tiporeserva_id, valr_reserva: @reserva.valr_reserva }
    end

    assert_redirected_to reserva_path(assigns(:reserva))
  end

  test "should show reserva" do
    get :show, id: @reserva
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserva
    assert_response :success
  end

  test "should update reserva" do
    patch :update, id: @reserva, reserva: { apartamento_id: @reserva.apartamento_id, condominio_id: @reserva.condominio_id, data_autorizacao: @reserva.data_autorizacao, data_cancelamento: @reserva.data_cancelamento, data_reserva: @reserva.data_reserva, email_solicitante: @reserva.email_solicitante, flag_autorizado: @reserva.flag_autorizado, hora_fim: @reserva.hora_fim, hora_inicio: @reserva.hora_inicio, nome_solicitante: @reserva.nome_solicitante, tiporeserva_id: @reserva.tiporeserva_id, valr_reserva: @reserva.valr_reserva }
    assert_redirected_to reserva_path(assigns(:reserva))
  end

  test "should destroy reserva" do
    assert_difference('Reserva.count', -1) do
      delete :destroy, id: @reserva
    end

    assert_redirected_to reservas_path
  end
end
