require 'test_helper'

class DividasControllerTest < ActionController::TestCase
  setup do
    @divida = dividas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dividas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create divida" do
    assert_difference('Divida.count') do
      post :create, divida: { condominio_id: @divida.condominio_id, contabanck_id: @divida.contabanck_id, data_cadastro: @divida.data_cadastro, data_cancelamento: @divida.data_cancelamento, data_pagamento: @divida.data_pagamento, data_vencimento: @divida.data_vencimento, desc_caminhocheque: @divida.desc_caminhocheque, desc_docprincipal: @divida.desc_docprincipal, desc_observacao: @divida.desc_observacao, flag_despesafixa: @divida.flag_despesafixa, flag_ordinaria: @divida.flag_ordinaria, numg_tipopagamento: @divida.numg_tipopagamento, numr_cheque: @divida.numr_cheque, numr_notafiscal: @divida.numr_notafiscal, numr_parcela: @divida.numr_parcela, numr_tipodivida: @divida.numr_tipodivida, prestador_id: @divida.prestador_id, valr_divida: @divida.valr_divida, valr_juro: @divida.valr_juro, valr_multa: @divida.valr_multa, valr_pagamento: @divida.valr_pagamento }
    end

    assert_redirected_to divida_path(assigns(:divida))
  end

  test "should show divida" do
    get :show, id: @divida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @divida
    assert_response :success
  end

  test "should update divida" do
    patch :update, id: @divida, divida: { condominio_id: @divida.condominio_id, contabanck_id: @divida.contabanck_id, data_cadastro: @divida.data_cadastro, data_cancelamento: @divida.data_cancelamento, data_pagamento: @divida.data_pagamento, data_vencimento: @divida.data_vencimento, desc_caminhocheque: @divida.desc_caminhocheque, desc_docprincipal: @divida.desc_docprincipal, desc_observacao: @divida.desc_observacao, flag_despesafixa: @divida.flag_despesafixa, flag_ordinaria: @divida.flag_ordinaria, numg_tipopagamento: @divida.numg_tipopagamento, numr_cheque: @divida.numr_cheque, numr_notafiscal: @divida.numr_notafiscal, numr_parcela: @divida.numr_parcela, numr_tipodivida: @divida.numr_tipodivida, prestador_id: @divida.prestador_id, valr_divida: @divida.valr_divida, valr_juro: @divida.valr_juro, valr_multa: @divida.valr_multa, valr_pagamento: @divida.valr_pagamento }
    assert_redirected_to divida_path(assigns(:divida))
  end

  test "should destroy divida" do
    assert_difference('Divida.count', -1) do
      delete :destroy, id: @divida
    end

    assert_redirected_to dividas_path
  end
end
