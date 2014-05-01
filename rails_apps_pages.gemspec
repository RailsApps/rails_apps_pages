# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_apps_pages/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_apps_pages"
  spec.version       = RailsAppsPages::VERSION
  spec.authors       = ["Daniel Kehoe"]
  spec.email         = ["daniel@danielkehoe.com"]
  spec.summary       = %q{Add pages to a Rails application, including controllers, views, and routing.}
  spec.description   = %q{A utility gem to use during development. Generates controllers, views, and routing.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
