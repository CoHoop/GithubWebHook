require 'logger'

module HookLogger
  @@logger ||= Logger.new(File.expand_path('../../log/application.log', __FILE__))
  @@logger.level = Logger::DEBUG

  def self.log data
    @@logger.info(data)
  end
end
