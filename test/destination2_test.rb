require "test_helper"
require 'mini_exiftool'

class Destination2Test < MiniTest::Unit::TestCase

  def setup
    @samples = Pathname.new(__FILE__).parent.parent + "samples"
  end

  def read_exif(sample_file)
     MiniExiftool.new((@samples + sample_file) .to_path).to_hash 
  end

  def test_defy_jpg
    exif_data =read_exif('2012-09-20_09-00-41_742.jpg')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20120920_070037.jpg', dest.file)
  end

  def test_canon_s5_jpg
    exif_data =read_exif('IMG_0001.JPG')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20121120_202644.jpg', dest.file)
  end

  def test_nikon_d3200_jpg
    exif_data =read_exif('DSC_0001.JPG')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20131008_134848_50.jpg', dest.file)
  end

  def test_lumix_ls80_jpg
    exif_data =read_exif('P1010001.JPG')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20080820_143812.jpg', dest.file)
  end
end