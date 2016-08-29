require 'test_helper'

class TipotermosControllerTest < ActionController::TestCase
  setup do
    @tipotermo = tipotermos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipotermos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipotermo" do
    assert_difference('Tipotermo.count') do
      post :create, tipotermo: { desc_tipotermo: @tipotermo.desc_tipotermo, nome_tipotermo: @tipotermo.nome_tipotermo }
    end

    assert_redirected_to tipotermo_path(assigns(:tipotermo))
  end

  test "should show tipotermo" do
    get :show, id: @tipotermo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipotermo
    assert_response :success
  end

  test "should update tipotermo" do
    patch :update, id: @tipotermo, tipotermo: { desc_tipotermo: @tipotermo.desc_tipotermo, nome_tipotermo: @tipotermo.nome_tipotermo }
    assert_redirected_to tipotermo_path(assigns(:tipotermo))
  end

  test "should destroy tipotermo" do
    assert_difference('Tipotermo.count', -1) do
      delete :destroy, id: @tipotermo
    end

    assert_redirected_to tipotermos_path
  end
end
