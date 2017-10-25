# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "icic/version"

Gem::Specification.new do |spec|
  spec.name          = "icic"
  spec.version       = Icic::VERSION
  spec.authors       = ["Adi Nugroho"]
  spec.email         = ["hidrodixtion@gmail.com"]

  spec.summary       = %q{The easiest way to generate ios & android image asset.}
  spec.description   = %q{icic is a command line interface to automate creation of image asset for ios and android from single image file. This tool depend on ImageMagick / GraphicsMagic, please read on github (by clicking github star button) for more info.}
  spec.homepage      = "https://github.com/hidrodixtion/icic"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["icic"]# spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
