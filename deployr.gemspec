# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deployr/version'

Gem::Specification.new do |spec|
  spec.name          = "deployr"
  spec.version       = Deployr::VERSION
  spec.authors       = ["Serge Paquet"]
  spec.email         = ["srgpqt@gmail.com"]
  spec.summary       = %q{Simple deployment framework powered by GitLab Webhooks}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "json"

  spec.add_development_dependency "bundler", ">= 1.6"
  spec.add_development_dependency "rake", ">= 10.0"
end
