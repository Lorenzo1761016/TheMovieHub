require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get stats" do
    get stats_stats_url
    assert_response :success
  end

end
