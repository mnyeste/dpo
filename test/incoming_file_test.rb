require "test_helper"
require "tempfile"

class IncomingFileTest < MiniTest::Unit::TestCase

  def test_file_exists
    tf = Tempfile.new('sample.jpg')

    inf = Dpo::IncomingFile.new(tf)
    refute_nil(inf);
  end

  def test_file_data
    Dir.mktmpdir {|dir|      
      tmpdir = Pathname.new(dir)
      fakefile = tmpdir + 'fakefile.jpg'
      FileUtils.touch(fakefile)

      inf = Dpo::IncomingFile.new(fakefile.to_s)
 
      assert_equal('fakefile.jpg', inf.basename.to_s)
      assert_equal('.jpg', inf.extension)
    }
  end

  def test_file_does_not_exist
    assert_raises(RuntimeError) {
      inf = Dpo::IncomingFile.new('fake.jpg')
    }
  end
end