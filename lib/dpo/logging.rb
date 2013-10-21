require 'logger'

module Dpo::Logging

  # This is the magical bit that gets mixed into your classes
  def log
    Dpo::Logging.log
  end

  # Global, memoized, lazy initialized instance of a logger
  def self.log

    @log ||= Logger.new(STDOUT)

    #if @log.nil?

    #  @log = Logger.new(STDOUT)
    #  @log.level = Logger::DEBUG
    #  @log.formatter = proc do |severity, datetime, progname, msg|
    #    "[#{datetime.strftime('%T')}] #{severity.ljust(5)} #{msg}\n"
    #  end

    #end
  end

end