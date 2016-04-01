# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pingilish/version'

Gem::Specification.new do |spec|
  spec.name          = "pingilish"
  spec.version       = Pingilish::VERSION
  spec.authors       = ["tokhi"]
  spec.email         = ["shafi.tokhi@gmail.com"]

  spec.summary       = "converts persian text to latin and latin to persian"
  spec.description   = ""
  spec.homepage      = "https://github.com/tokhi/pingilish"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
