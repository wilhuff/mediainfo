require "test_helper"
require "mediainfo_test_helper"

class HDVTransportStream < ActiveSupport::TestCase
  def setup
    @info = mediainfo_mock "hdv_transport_stream.m2t"
  end

  ### GENERAL
  
  test "encoded_date" do
    assert_equal Time.parse("UTC 2000-01-01 00:00:00"), @info.encoded_date
    assert_equal "UTC 2000-00-00 00:00:00", @info.encoded_date_before_type_cast
  end
  
  mediainfo_test_not_an_image
end
