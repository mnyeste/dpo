# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dpo/version'

Gem::Specification.new do |spec|
  spec.name          = "dpo"
  spec.version       = Dpo::VERSION
  spec.authors       = ["Mihály Nyeste"]
  spec.email         = ["mihaly.nyeste@gmail.com"]
  spec.description   = %q{Organize digital photos with simple scripts}
  spec.summary       = %q{Digital Photo Organizer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mini_exiftool"
  spec.add_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
