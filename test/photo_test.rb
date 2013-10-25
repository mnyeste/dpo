require "test_helper"

class PhotoTest < MiniTest::Unit::TestCase

  def test_new_exists

    photo = Dpo::Photo.new('samples/nikon_d3200_1.jpg')
    refute_nil(photo);

  end

  def test_new_not_exists

    assert_raises(RuntimeError) {
      photo = Dpo::Photo.new('samples/fake.jpg')
    }

  end

end