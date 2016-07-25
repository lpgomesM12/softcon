require 'test_helper'

class RelatorioControllerTest < ActionController::TestCase
  test "should get reserva" do
    get :reserva
    assert_response :success
  end

end
