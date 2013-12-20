require "test_helper"
require "tmpdir"

class PhotoSeekerTest < MiniTest::Unit::TestCase

  def test_start_dir_exists
    Dir.mktmpdir('dir_to_seek_for_photos') do |tmpdir|
      photo_seeker = Dpo::PhotoSeeker.new(tmpdir);
      refute_nil(photo_seeker);
    end
  end

  def test_start_dir_does_not_exist
    assert_raises(RuntimeError) {
      photo_seeker = Dpo::PhotoSeeker.new('/tmp/fake_dir');
    }
  end

  def test_start_exist_but_not_dir
    tf = Tempfile.new('fake_dir')
    assert_raises(RuntimeError) {
      photo_seeker = Dpo::PhotoSeeker.new(tf.path);
    }
  end
end