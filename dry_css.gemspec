# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dry_css/version'

Gem::Specification.new do |spec|
  spec.name          = "dry_css"
  spec.version       = DryCss::VERSION
  spec.authors       = ["gpxl"]
  spec.email         = ["gerlando@gmail.com"]
  spec.description   = %q{A gem for pointing out redundant css}
  spec.summary       = %q{A gem for pointing out redundant css (ironic?)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
