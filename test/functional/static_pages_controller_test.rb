require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get admin_home" do
    get :admin_home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
