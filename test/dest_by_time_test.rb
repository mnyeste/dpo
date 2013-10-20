require "test_helper"

class ExifDataTest < MiniTest::Unit::TestCase

	def test_filename

		dbt = Dpo::DestByTime.new('samples/nikon_d3200_1.jpg')

    assert_equal('20120117_084631', dbt.filename)
    assert_equal(Pathname.new('2012/2012-01-17'), dbt.dstpath)

  end

end