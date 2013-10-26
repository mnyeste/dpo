require 'pathname'
require 'fileutils'
require 'logger'

class SpecHarness

  attr_reader :sample_photo_dir, :log

  INCOMING_DIR = 'incoming';
  TARGET_DIR = 'organized';

  def initialize
    log_init
    set_dirs
    create_dirs
  end

  def log_init

    @log = Logger.new(STDOUT)
    @log.level = Logger::DEBUG

    @log.formatter = proc do |severity, datetime, progname, msg|
      "[#{datetime.strftime('%T')}] #{severity.ljust(5)} #{msg}\n"
    end

  end

  def set_dirs
    project_root = Pathname.new(__FILE__).parent.parent

    @sample_photo_dir = project_root + 'samples'
    @harness_workspace = project_root + 'build' + 'spec_workspace'
  end

  def create_dirs

    @log.info('Creating test harness in: ' + @harness_workspace.to_s)

    FileUtils.rm_rf(@harness_workspace)
    FileUtils.mkdir_p(@harness_workspace)

    FileUtils.mkdir_p(@harness_workspace + INCOMING_DIR)

  end

  def prepare(filelist)

    if @prepared
      return
    end

    @log.info('Preparing harness')

    filelist.each do |file|
      @log.debug('Copy file to harness: ' + file)
      FileUtils.cp(@sample_photo_dir + file, @harness_workspace + INCOMING_DIR)
    end

    @prepared = true

  end

  private :create_dirs, :set_dirs

end