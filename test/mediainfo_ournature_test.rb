require "test_helper"
require "mediainfo_test_helper"

class MediainfoOurNatureTest < ActiveSupport::TestCase
  def setup
    @info = mediainfo_mock "OurNatureAdventure.mpg"
  end

  ### GENERAL
  
  test "audio?" do
    assert @info.audio?
  end
  
  test "video?" do
    assert @info.video?
  end
  
  test "format" do
    assert_equal "MPEG-PS", @info.format
  end
  
  test "codec" do
    assert_equal "MPEG-PS", @info.codec
  end

  test "File last modification date (local)" do
    assert_equal "2012-03-19 11:25:29", @info.last_modifiaction_date
  end

  mediainfo_test_size

  ### IMAGE
  
  mediainfo_test_not_an_image
end
