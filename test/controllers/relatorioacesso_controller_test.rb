require 'test_helper'

class RelatorioacessoControllerTest < ActionController::TestCase
  test "should get relatorio" do
    get :relatorio
    assert_response :success
  end

end
