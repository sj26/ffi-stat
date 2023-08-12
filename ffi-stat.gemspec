# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ffi-stat"
  spec.version       = "2.0.0"
  spec.authors       = ["Adam Tanner", "Samuel Cochran"]
  spec.email         = ["adam@adamtanner.org", "sj26@sj26.com"]
  spec.description   = %q{ Ruby FFI bindings for stat }
  spec.summary       = %q{ Ruby FFI bindings for stat }
  spec.homepage      = "https://github.com/sj26/ffi-stat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.extensions    = ["ext/ffi_stat_ext/extconf.rb"]
  spec.require_paths = ["lib", "ext/ffi_stat_ext"]

  spec.add_dependency "ffi"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", '~> 3.3'
end
