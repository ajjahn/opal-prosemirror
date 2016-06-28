# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prose_mirror/version'

Gem::Specification.new do |spec|
  spec.name          = "opal-prosemirror"
  spec.version       = ProseMirror::VERSION
  spec.authors       = ["Adam Jahn"]
  spec.email         = ["ajjahn@gmail.com"]
  spec.summary       = %q{Opal wrapper for ProseMirror}
  spec.description   = %q{Opal wrapper for ProseMirror}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "opal", "~> 0.8"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "opal-rspec", "~> 0.5.0"
end
