require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    help = "Help"
    contact = "Contact"
    about = "About"
    views = ["Home","Help","Contact","About"]
    title = "Ruby on Rails Tutorial Sample App"
    views.each do |view|
      if view == "Home"
        assert_equal full_title, title
      else
        assert_equal full_title(view), "#{view} | #{title}"
      end
    end

  end
end