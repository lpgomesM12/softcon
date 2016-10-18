require 'test_helper'

class InadimplentesControllerTest < ActionController::TestCase
  setup do
    @inadimplente = inadimplentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inadimplentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inadimplente" do
    assert_difference('Inadimplente.count') do
      post :create, inadimplente: { apartamento_id: @inadimplente.apartamento_id }
    end

    assert_redirected_to inadimplente_path(assigns(:inadimplente))
  end

  test "should show inadimplente" do
    get :show, id: @inadimplente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inadimplente
    assert_response :success
  end

  test "should update inadimplente" do
    patch :update, id: @inadimplente, inadimplente: { apartamento_id: @inadimplente.apartamento_id }
    assert_redirected_to inadimplente_path(assigns(:inadimplente))
  end

  test "should destroy inadimplente" do
    assert_difference('Inadimplente.count', -1) do
      delete :destroy, id: @inadimplente
    end

    assert_redirected_to inadimplentes_path
  end
end
