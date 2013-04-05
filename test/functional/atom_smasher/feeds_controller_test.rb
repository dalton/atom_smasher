require 'test_helper'

module AtomSmasher
  class FeedsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
