require ::File.expand_path('../logger.rb', __FILE__)

module GithubWebHook
  class HookProcessor
    def initialize(data)
      @data = data
    end

    def run
      Logger.log(@data)
    end
  end
end
