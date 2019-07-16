require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    #it’s actually not necessary to get the signup path before posting to the users path.
    #I prefer to include both steps, though, both for conceptual clarity and to double-check
    #that the signup form renders without error.
    get signup_path

    #assert_no_difference verifies the count did not change
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end

    #verifies that we are still on the users/new page
    assert_template 'users/new'
    assert_select "form[action='/signup']"
    assert_select "form"
    assert_select "form input", 6
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
    assert_select "div#error_explanation ul" do |element|
      assert_select element, "li", "Name can't be blank"
      assert_select element, "li", "Email is invalid"
      assert_select element, "li", "Password confirmation doesn't match Password"
      assert_select element, "li", "Password is too short (minimum is 6 characters)"
    end
  end
end
