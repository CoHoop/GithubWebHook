require 'json'
require ::File.expand_path('../hook_processor.rb', __FILE__)
require ::File.expand_path('../logger.rb', __FILE__)

module GithubWebHook
  class Dispatcher
    class << self
      def initialize(request)
        begin
          data = request.body.read

          # The received Json is actually set into the body, not in request.POST
          HookLogger::log(data)
          json = JSON::parse(data)
          hook_processor = GithubWebHook::HookProcessor.new(json)
          hook_processor.run

          status = 200
          body   = 'OK'
        rescue
          status = 500
          body   = 'Wrong Content-type sent'
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
