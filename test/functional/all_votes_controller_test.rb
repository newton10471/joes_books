require 'test_helper'

class AllVotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
