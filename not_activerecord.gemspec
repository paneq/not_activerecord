# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'not_activerecord/version'

Gem::Specification.new do |spec|
  spec.name          = "not_activerecord"
  spec.version       = NotActiveRecord::VERSION
  spec.authors       = ["Robert Pankowecki"]
  spec.email         = ["robert.pankowecki@gmail.com"]
  spec.description   = %q{Gem which helps you in not providing associations}
  spec.summary       = %q{does_not}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
