require "test_helper"
require "tmpdir"

class FileOrganizerTest < MiniTest::Unit::TestCase

  def test_incoming_dir_exists

    Dir.mktmpdir('dpo') do |tmpdir|

      incoming = Pathname.new(tmpdir)+'incoming'
      organized = Pathname.new(tmpdir)+'organized' 

      Dir::mkdir(incoming)
      Dir::mkdir(organized)

      fo = Dpo::FileOrganizer.new(incoming, organized)
      
      refute_nil(fo);

    end

  end

  def test_incoming_dir_does_not_exist

    assert_raises(RuntimeError) {
          fo = Dpo::FileOrganizer.new('fake',nil)
    }

  end

  def test_create_organized_dir

    Dir.mktmpdir('dpo') do |tmpdir|

      incoming = Pathname.new(tmpdir)+'incoming'
      organized = Pathname.new(tmpdir)+'organized' 

      Dir::mkdir(incoming)

      fo = Dpo::FileOrganizer.new(incoming, organized)
      
      assert(organized.directory?)      

    end

  end

end