require 'test_helper'

class GrupopermissaousersControllerTest < ActionController::TestCase
  setup do
    @grupopermissaouser = grupopermissaousers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupopermissaousers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupopermissaouser" do
    assert_difference('Grupopermissaouser.count') do
      post :create, grupopermissaouser: { grupopermissao_id: @grupopermissaouser.grupopermissao_id, user_id: @grupopermissaouser.user_id }
    end

    assert_redirected_to grupopermissaouser_path(assigns(:grupopermissaouser))
  end

  test "should show grupopermissaouser" do
    get :show, id: @grupopermissaouser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupopermissaouser
    assert_response :success
  end

  test "should update grupopermissaouser" do
    patch :update, id: @grupopermissaouser, grupopermissaouser: { grupopermissao_id: @grupopermissaouser.grupopermissao_id, user_id: @grupopermissaouser.user_id }
    assert_redirected_to grupopermissaouser_path(assigns(:grupopermissaouser))
  end

  test "should destroy grupopermissaouser" do
    assert_difference('Grupopermissaouser.count', -1) do
      delete :destroy, id: @grupopermissaouser
    end

    assert_redirected_to grupopermissaousers_path
  end
end
