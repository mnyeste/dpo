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

  it "copy from non-existing source should fail" do
    status=system("ruby", "#{@bin}/dpo_copy", "fake1", "fake2")
    assert(!status)
  end

  it "copy to non-existing destination should fail" do
    Dir.mktmpdir {|dir|      
      tmpdir = Pathname.new(dir)
      srcdir = tmpdir + 'source'
      FileUtils.mkdir(srcdir)
      
      status=system("ruby", "#{@bin}/dpo_copy", srcdir.to_s , "fake2")
      assert(!status)
    }
  end

  it "copy to non-writeable destination should fail" do
    Dir.mktmpdir {|dir|      
      tmpdir = Pathname.new(dir)
      srcdir = tmpdir + 'source'
      FileUtils.mkdir(srcdir)
      dstdir = tmpdir + 'destination'
      FileUtils.mkdir(dstdir, :mode => 0444)

      status=system("ruby", "#{@bin}/dpo_copy", srcdir.to_s , dstdir.to_s)
      assert(!status)
    }
  end

  it "copy files should pass" do
  
    sh = SpecHarness.new
    sh.prepare_files(['IMG_0001.JPG', 'DSC_0001.JPG', '2012-09-20_09-00-41_742.jpg'], "100")
    sh.prepare_files(['P1010001.JPG', 'picture_without_exif.jpg' ], "101")

    status=system("ruby", "#{@bin}/dpo_copy", sh.incoming_dir.to_s , sh.organized_dir.to_s)

    assert(status)

  end

end