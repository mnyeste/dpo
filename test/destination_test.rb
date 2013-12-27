require "test_helper"


class DestinationTest < MiniTest::Unit::TestCase

  def test_without_subsecs

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,4,18,5,5,10)
    }

    folder = Dpo::Destination.folder(stub_exif_data)
    file = Dpo::Destination.file(stub_exif_data, '.jpg')

    assert_equal(Pathname.new('2013/2013-04-18'), folder)
    assert_equal('20130418_050510.jpg', file)
  end

  def test_with_subsecs

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,11,18,8,30,15),
      Dpo::Destination::EXIF_TAG_SSTO => 40
    }

    folder = Dpo::Destination.folder(stub_exif_data)
    file = Dpo::Destination.file(stub_exif_data, '.jpg')
    
    assert_equal(Pathname.new('2013/2013-11-18'), folder)
    assert_equal('20131118_083015_40.jpg', file)
  end  

  def test_no_exif

    assert_raises(RuntimeError) {
      dst = Dpo::Destination.folder(Hash.new)
    }
    
  end  

end