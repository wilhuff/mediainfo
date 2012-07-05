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
    assert_equal Time.parse("UTC 2012-03-19 10:25:29"), @info.last_modification_date
  end

  mediainfo_test_size

  ### VIDEO

  test "Video -> Colorspace" do
    assert_equal "YUV", @info.video.colorspace
  end

  test "Video -> Colorimetry" do
    assert_equal "4:2:0", @info.video.colorimetry
  end

  test "Video -> Codec" do
    assert_equal "MPEG-2 Video", @info.video.codec
  end

  test "Video -> Bit Depth" do
    assert_equal 8, @info.video.bit_depth
  end
 
  ### AUDIO

  test "Audio -> Codec" do
    assert_equal "MPEG-1 Audio layer 2", @info.audio.codec
  end

  test "Audio -> SamplingRate" do
    assert_equal 48000, @info.audio.sample_rate
  end

  ### IMAGE
  
  mediainfo_test_not_an_image
end
