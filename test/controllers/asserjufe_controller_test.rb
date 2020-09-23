require 'test_helper'

class AsserjufeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get asserjufe_index_url
    assert_response :success
  end

end
