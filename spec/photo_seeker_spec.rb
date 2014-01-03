require "minitest/autorun"
require "minitest/pride"

require "spec_harness"


describe Dpo::PhotoSeeker do

  it "seek for files" do
  
    sh = SpecHarness.new
    sh.prepare_files(['IMG_0001.JPG', 'DSC_0001.JPG', '2012-09-20_09-00-41_742.jpg'], "100")
    sh.prepare_files(['P1010001.JPG', 'picture_without_exif.jpg' ], "101")

    sh.create_empty_file("fake1.txt")
    sh.create_empty_file("fake2.info","100")

    ps=Dpo::PhotoSeeker.new(sh.incoming_dir)

    assert_equal(5, ps.seek.size)

  end

end