require "test_helper"
require "tempfile"

class PhotoTest < MiniTest::Unit::TestCase

  def test_file_exists
    tf = Tempfile.new('sample.jpg')

    photo = Dpo::Photo.new(tf)
    refute_nil(photo);
  end

  def test_file_data
    Dir.mktmpdir {|dir|      
      tmpdir = Pathname.new(dir)
      fakefile = tmpdir + 'fakefile.jpg'
      FileUtils.touch(fakefile)

      photo = Dpo::Photo.new(fakefile.to_s)
 
      assert_equal('fakefile.jpg', photo.basename.to_s)
      assert_equal('.jpg', photo.extension)
    }
  end

  def test_file_does_not_exist
    assert_raises(RuntimeError) {
      photo = Dpo::Photo.new('fake.jpg')
    }
  end
end