# This file is used by Rack-based servers to start the application.

require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/deploy', __FILE__)
require 'deployr/application'

run Deployr::Application.new(Deploy)
