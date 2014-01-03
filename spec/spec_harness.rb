require 'pathname'
require 'fileutils'

require "dpo"

class SpecHarness


  attr_reader :incoming_dir, :organized_dir

  INCOMING_DIR = 'incoming';
  ORGANIZED_DIR = 'organized';

  def initialize
    create_dirs
  end

  def create_dirs

    project_root = Pathname.new(__FILE__).parent.parent

    @sample_photo_dir = project_root + 'samples'
    @harness_workspace = project_root + 'build' + 'spec_workspace'

    FileUtils.rm_rf(@harness_workspace)
    
    @incoming_dir = @harness_workspace + INCOMING_DIR
    @organized_dir = @harness_workspace + ORGANIZED_DIR

    FileUtils.mkdir_p(@incoming_dir)
    FileUtils.mkdir_p(@organized_dir)

  end

  def prepare_files(filelist, folder = nil)
      
    target = @harness_workspace + INCOMING_DIR

    if folder
      target += folder
      FileUtils.mkdir_p(target)
    end

    filelist.each do |file|
      FileUtils.cp(@sample_photo_dir + file, target)
    end

  end

  def create_empty_file(filename, folder = nil)

    target = @harness_workspace + INCOMING_DIR
    
    if folder
      target += folder
      FileUtils.mkdir_p(target)
    end

    FileUtils.touch(target + filename)

  end



  private :create_dirs

end