require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/extensiontask"

RSpec::Core::RakeTask.new(:spec)

gemspec = Gem::Specification.load("ffi-stat.gemspec")

Rake::ExtensionTask.new("ffi_stat_ext", gemspec) do |ext|
  ext.ext_dir = "ext/ffi_stat_ext"
  ext.cross_compile = false
end

task :spec => [:clean, :compile]

task :default => :spec
