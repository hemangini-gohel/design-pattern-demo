# Creates only one object and works on it 

require 'singleton'

class SimpleLogger
  include Singleton

  attr_accessor :level, :log

  ERROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @log = File.open("log.txt", "w")
    @level = WARNING
  end

  def error(msg)
    log.puts(msg)
    log.flush
  end

  def warning(msg)
    log.puts(msg) if level >= WARNING
    log.flush
  end

  def info(msg)
    log.puts(msg) if level >= INFO
    log.flush
  end
end


SimpleLogger.instance.error('ERROR: Computer wins chess game.')
SimpleLogger.instance.warning('WARNING: Computer wins chess game.')
SimpleLogger.instance.info('INFO: Computer wins chess game.')
