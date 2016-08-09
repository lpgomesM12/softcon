require 'test_helper'

class ContatoprestadorsControllerTest < ActionController::TestCase
  setup do
    @contatoprestador = contatoprestadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contatoprestadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contatoprestador" do
    assert_difference('Contatoprestador.count') do
      post :create, contatoprestador: { desc_contato: @contatoprestador.desc_contato, desc_tipocontado: @contatoprestador.desc_tipocontado, prestador_id: @contatoprestador.prestador_id }
    end

    assert_redirected_to contatoprestador_path(assigns(:contatoprestador))
  end

  test "should show contatoprestador" do
    get :show, id: @contatoprestador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contatoprestador
    assert_response :success
  end

  test "should update contatoprestador" do
    patch :update, id: @contatoprestador, contatoprestador: { desc_contato: @contatoprestador.desc_contato, desc_tipocontado: @contatoprestador.desc_tipocontado, prestador_id: @contatoprestador.prestador_id }
    assert_redirected_to contatoprestador_path(assigns(:contatoprestador))
  end

  test "should destroy contatoprestador" do
    assert_difference('Contatoprestador.count', -1) do
      delete :destroy, id: @contatoprestador
    end

    assert_redirected_to contatoprestadors_path
  end
end
