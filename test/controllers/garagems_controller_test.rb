require 'test_helper'

class GaragemsControllerTest < ActionController::TestCase
  setup do
    @garagem = garagems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garagems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garagem" do
    assert_difference('Garagem.count') do
      post :create, garagem: { apartamento_id: @garagem.apartamento_id, cobertura_id: @garagem.cobertura_id, condominio_id: @garagem.condominio_id, numr_garagem: @garagem.numr_garagem }
    end

    assert_redirected_to garagem_path(assigns(:garagem))
  end

  test "should show garagem" do
    get :show, id: @garagem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garagem
    assert_response :success
  end

  test "should update garagem" do
    patch :update, id: @garagem, garagem: { apartamento_id: @garagem.apartamento_id, cobertura_id: @garagem.cobertura_id, condominio_id: @garagem.condominio_id, numr_garagem: @garagem.numr_garagem }
    assert_redirected_to garagem_path(assigns(:garagem))
  end

  test "should destroy garagem" do
    assert_difference('Garagem.count', -1) do
      delete :destroy, id: @garagem
    end

    assert_redirected_to garagems_path
  end
end
