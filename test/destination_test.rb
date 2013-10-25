require "test_helper"


class DestinationTest < MiniTest::Unit::TestCase

  def test_without_subsecs

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,4,18,5,5,10)
    }

    dst = Dpo::Destination.date_time_original(stub_exif_data)
    assert_equal(Pathname.new('2013/2013-04-18/20130418_050510'), dst)

  end

  def test_with_subsecs

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,11,18,8,30,15),
      Dpo::Destination::EXIF_TAG_SSTO => "40"
    }

    dst = Dpo::Destination.date_time_original(stub_exif_data)
    assert_equal(Pathname.new('2013/2013-11-18/20131118_083015_40'), dst)

  end  

  def test_no_exif

    assert_raises(RuntimeError) {
      dst = Dpo::Destination.date_time_original(Hash.new)
    }
    
  end  

end