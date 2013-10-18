
require "test_helper"

class ExifAdapterTest < MiniTest::Unit::TestCase

	def test_create

		@ea = Dpo::ExifAdapter.new('fake')

	end

	def test_dummy
		assert 'none'
	end
end