# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_hubspot/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_hubspot"
  spec.version       = SimpleHubspot::VERSION
  spec.authors       = ["Breno Oliveira"]
  spec.email         = ["breno26@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{SimpleHubspot Gem is a pure light-weight implementation for Hubspot API. Best for non-rails apps.}
  spec.description   = %q{SimpleHubspot Gem is a pure light-weight implementation for Hubspot API. Best for non-rails apps.}
  spec.homepage      = "https://github.com/brenooliveira/simple_hubspot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'rest-client'
end
