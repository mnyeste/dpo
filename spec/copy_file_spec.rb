require "minitest/autorun"
require "minitest/pride"

require "spec_harness"

class CopyFile
end

describe CopyFile do
  before do
    sh = SpecHarness.new

    sh.prepare(['nikon_d3200_1.jpg'])

  end

  it "should greet" do
    puts "Hello world"
  end

end