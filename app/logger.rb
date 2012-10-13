require 'logger'

module HookLogger
  logger ||= Logger.new(File.expand_path('../log/application.rb', __FILE__))
  logger.level = Logger::WARN

  def log string
    logger.log(string)
  end
end
