require "test_helper"


class DestinationTest < MiniTest::Unit::TestCase

  def test_file_with_subsecs

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,11,18,8,30,15),
      Dpo::Destination::EXIF_TAG_SSTO => 40
    }

    dest = Dpo::Destination.new(stub_exif_data, '.jpg') 
    
    assert_equal('20131118_083015_40.jpg', dest.file)
  end  

  def test_file_without_subsecs

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,4,18,5,5,10)
    }

    dest = Dpo::Destination.new(stub_exif_data, '.jpg') 
    assert_equal('20130418_050510.jpg', dest.file)
  end

  def test_folder_with_camera

    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,4,18,5,5,10),
      Dpo::Destination::EXIF_TAG_CMN => 'NIKON D3200'
    }
  
    dest = Dpo::Destination.new(stub_exif_data, '.jpg') 
    assert_equal(Pathname.new('2013/2013-04-18-nikon-d3200'), dest.folder)    

  end

  def test_folder_without_camera
    stub_exif_data = {
      Dpo::Destination::EXIF_TAG_DTO => Time.new(2013,11,18,8,30,15)
    }
  
    dest = Dpo::Destination.new(stub_exif_data, '.jpg') 
    assert_equal(Pathname.new('2013/2013-11-18'), dest.folder)    
  
  end


  def test_no_exif

    assert_raises(RuntimeError) {
      dest = Dpo::Destination.new(Hash.new,'.jpg')
    }
    
  end  

end