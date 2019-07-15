require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    #it’s actually not necessary to get the signup path before posting to the users path.
    #I prefer to include both steps, though, both for conceptual clarity and to double-check
    #that the signup form renders without error.
    get signup_path

    #assert_no_difference verifies the count did not change
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end

    #verifies that we are still on the users/new page
    assert_template 'users/new'
  end
end
