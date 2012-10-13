require 'logger'

module Logger
  logger ||= Logger.new(File.expand_path('../log/production.rb', __FILE__))
  logger.level = Logger::WARN

  def log string
    logger.log(string)
  end
end
