require 'rack'
require ::File.expand_path('../dispatcher.rb', __FILE__ )

module GithubWebHook
  class Application
    def call env
      response = Dispatcher::initialize(Rack::Request.new(env))
      [ response[:status], {'Content-Type' => 'text/plain' }, [response[:body]] ]
    end
  end
end
