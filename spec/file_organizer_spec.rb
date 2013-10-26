require "minitest/autorun"
require "minitest/pride"

require "spec_harness"
require "dpo"


describe Dpo::FileOrganizer do
  before do
    @sh = SpecHarness.new
    @sh.prepare(['IMG_0001.JPG', 'DSC_0001.JPG', '2012-09-20_09-00-41_742.jpg', 'picture_without_exif.jpg' ])
  end

  it "file should be renamed and moved based on EXIF date" do
    
    fo = Dpo::FileOrganizer.new(@sh.incoming_dir, @sh.organized_dir)

    fo.move

  end

end