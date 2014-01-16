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
    assert_equal(Pathname.new('2012/2012-09-20-defy'), dest.folder)
  end

  def test_canon_s5_jpg
    exif_data =read_exif('IMG_0001.JPG')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20121120_202644.jpg', dest.file)
    assert_equal(Pathname.new('2012/2012-11-20-canon-s5'), dest.folder)
  end

  def test_nikon_d3200_jpg
    exif_data =read_exif('DSC_0001.JPG')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20131008_134848_50.jpg', dest.file)
    assert_equal(Pathname.new('2013/2013-10-08-nikon-d3200'), dest.folder)
  end

  def test_lumix_ls80_jpg
    exif_data =read_exif('P1010001.JPG')

    dest = Dpo::Destination.new(exif_data, '.jpg') 
    assert_equal('20080820_143812.jpg', dest.file)
    assert_equal(Pathname.new('2008/2008-08-20-lumix-ls80'), dest.folder)
  end

  def test_canon_s5_avi
    exif_data =read_exif('MVI_0395.AVI')

    puts exif_data.inspect

    dest = Dpo::Destination.new(exif_data, '.avi') 
    assert_equal('20131222_142810.avi', dest.file)
    #assert_equal(Pathname.new('2013/2013-12-22-canon-s5'), dest.folder)
  end

  def test_nikon_d3200_mov
    exif_data =read_exif('DSC_0001.MOV')

    dest = Dpo::Destination.new(exif_data, '.mov') 
    assert_equal('20140110_225440.mov', dest.file)
  end

end