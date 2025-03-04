# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundleid_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "bundleid_helper"
  spec.version       = BundleidHelper::VERSION
  spec.authors       = ["Aaron Yang"]
  spec.email         = ["if1else0@gmail.com"]

  spec.summary       = %q{a command line tool to get app bundle id from ipa file}
  spec.description   = %q{usage: bundleid_helper name.ipa}
  spec.homepage      = "https://github.com/PowerOfCreation/bundleid_helper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["bundleid"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
