require "minitest/autorun"
require "minitest/pride"

require "spec_harness"


describe Dpo do

  before do
    @bin = Pathname.new(__FILE__).parent.parent + "bin"
  end
  
  it "copy without arguments should fail" do
    status=system("ruby", "#{@bin}/dpo_copy")
    assert(!status)
  end

  it "copy without non-existing folders" do
    status=system("ruby", "#{@bin}/dpo_copy", "fake1", "fake2")
    assert(!status)
  end

end