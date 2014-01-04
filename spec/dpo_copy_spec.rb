require "minitest/autorun"
require "minitest/pride"

require "spec_harness"


describe Dpo do

  before do
    @bin = Pathname.new(__FILE__).parent.parent + "bin"
  end
  
  it "execute copy" do
    system("ruby", "#{@bin}/dpo_copy")  
  end

end