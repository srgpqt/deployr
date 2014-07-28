require 'json'

module Deployr
  class Application
    def initialize(config_class)
      @config_class = config_class
    end

    def call(env)
      data = JSON.parse( env['rack.input'].read )

      conf = @config_class.new(data)
      conf.deploy

      if conf.handled?
        return [200, {'Content-Type' => 'text/plain'}, ['OKI']]
      else
        return [404, {'Content-Type' => 'text/plain'}, ['WAT']]
      end
    rescue
      return [500, {'Content-Type' => 'text/plain'}, ['ERR']]
    end
  end
end
