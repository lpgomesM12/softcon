require 'test_helper'

class TiporeservasControllerTest < ActionController::TestCase
  setup do
    @tiporeserva = tiporeservas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiporeservas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiporeserva" do
    assert_difference('Tiporeserva.count') do
      post :create, tiporeserva: { desc_tiporeserva: @tiporeserva.desc_tiporeserva }
    end

    assert_redirected_to tiporeserva_path(assigns(:tiporeserva))
  end

  test "should show tiporeserva" do
    get :show, id: @tiporeserva
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiporeserva
    assert_response :success
  end

  test "should update tiporeserva" do
    patch :update, id: @tiporeserva, tiporeserva: { desc_tiporeserva: @tiporeserva.desc_tiporeserva }
    assert_redirected_to tiporeserva_path(assigns(:tiporeserva))
  end

  test "should destroy tiporeserva" do
    assert_difference('Tiporeserva.count', -1) do
      delete :destroy, id: @tiporeserva
    end

    assert_redirected_to tiporeservas_path
  end
end
