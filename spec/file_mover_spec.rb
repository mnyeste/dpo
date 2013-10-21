require "minitest/autorun"
require "minitest/pride"

require "spec_harness"
require "dpo"


describe Dpo::FileMover do
  before do
    sh = SpecHarness.new
    sh.prepare(['nikon_d3200_1.jpg'])
  end

  it "file should be renamed and moved based on EXIF date" do
    
    #Dpo::FileMover.move('nikon_d3200_1.jpg',Dpo::DestByTime)

  end

end