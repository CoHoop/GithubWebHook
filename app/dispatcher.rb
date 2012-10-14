require 'json'
require ::File.expand_path('../hook_processor.rb', __FILE__)
require ::File.expand_path('../logger.rb', __FILE__)

class RequestDataError  < StandardError; end

module GithubWebHook
  class Dispatcher
    class << self
      def initialize(request)
        begin
          data = request.POST['payload'] || (raise RequestDataError)

          # The received Json is actually set into the body, not in request.POST
          HookLogger::log(data)
          json = JSON::parse(data)
          hook_processor = GithubWebHook::HookProcessor.new(json)
          hook_processor.run

          status = 200
          body   = 'OK'
        rescue RequestDataError
          status = 500
          body   = 'Wrong content sent, expecting payload through POST'
        ensure
          HookLogger::log(body)
          return  {
            status: status,
            body:   body
          }
        end
      end
    end
  end
end
