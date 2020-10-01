ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'


require_relative '../contact_list'



class Contact_List_Test < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_redirect_to_index_page
    get "/"
    assert_equal 302, last_response.status
  end

  def test_index_page
    get "/contacts"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "Family"
    assert_includes last_response.body, "Friends"
    assert_includes last_response.body, "Work"
    assert_includes last_response.body, "New Contact"
  end

  def test_view_new_contact_form
    get "/contacts/create"
    assert_includes last_response.body, %q(input name="group")
    assert_includes last_response.body, %q(input name="name")
    assert_includes last_response.body, %q(button type="submit")
  end

  def test_create_new_contact
    post "/contacts/create", group: "Family", name: "Steven"

    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_includes last_response.body, "New contact has been added"
    get "/"
    refute_includes last_response.body, "New contact has been added"
  end

end
