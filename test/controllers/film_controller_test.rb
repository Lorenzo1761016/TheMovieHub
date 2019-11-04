require 'test_helper'

class FilmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get film_index_url
    assert_response :success
  end

end
