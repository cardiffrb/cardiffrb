require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = {
      :provider => 'twitter',
      :uid => '123545',
      :name => "John Doe",
      :nickname => "johndoe"
    }
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

	# create
	test "it should redirect" do
		get :create, :provider => 'twitter'
		assert_response :redirect
	end

  test "it should find a user if they have previously signed in with twitter" do
    user = FactoryGirl.create(:user)
    get :create, :provider => 'twitter'
    assert_equal user, assigns(:user)
  end

end
