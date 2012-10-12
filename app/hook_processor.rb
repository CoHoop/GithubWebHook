module GithubWebHook
  class HookProcessor
    def initialize(data)
      @data = data
    end

    def run
      require 'awesome_print'
      ap @data
    end
  end
end
