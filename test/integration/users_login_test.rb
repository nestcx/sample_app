require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:michael)
	end



  test "login with remembering" do
    @user.reload
    log_in_as(@user, remember_me: '1')
    assert_equal cookies['remember_token'], assigns(:user).remember_token
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end


end
