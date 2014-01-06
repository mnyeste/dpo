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
      FileUtils.mkdir(dstdir, :mode => 444)

      status=system("ruby", "#{@bin}/dpo_copy", srcdir.to_s , "fake2")
      assert(!status)
    }
  end

end