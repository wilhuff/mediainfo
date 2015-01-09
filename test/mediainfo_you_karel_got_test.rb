require "test_helper"
require "mediainfo_test_helper"

class YouKarelGotTest < ActiveSupport::TestCase
  def setup
    @info = mediainfo_mock "you_karel_got.mxf"
  end

  ### GENERAL
  
  test "duration" do
    assert_equal 175600, @info.duration
    assert_equal "00:02:55.600", @info.duration_before_type_cast
  end
  
  mediainfo_test_not_an_image
end
