require "test_helper"

class ExifDataTest < MiniTest::Unit::TestCase

	def test_filename
		ed = Dpo::ExifData.new('samples/nikon_d3200_1.jpg')
    assert_equal('20120117_084631', ed.filename)
  end

end