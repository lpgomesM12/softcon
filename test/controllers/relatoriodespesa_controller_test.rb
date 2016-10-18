require 'test_helper'

class RelatoriodespesaControllerTest < ActionController::TestCase
  test "should get relatorio" do
    get :relatorio
    assert_response :success
  end

end
