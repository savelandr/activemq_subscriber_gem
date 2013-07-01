require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems/package_task'

rdoc_opts = ["--exclude", "unit_tests/"]
files = ["activemq_subscriber.rb", "CHANGELOG"]
desc "Default: run unit tests"
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.pattern = "unit_tests/tc_*.rb"
  t.verbose = true
end

RDoc::Task.new do |rdoc|
  rdoc.rdoc_files = files
end

update_spec = Gem::Specification.new do |spec|
  spec.author = "Bob Saveland"
  spec.email = "savelandr@aol.com"
  spec.homepage = "http://adsqa.office.aol.com"
  spec.platform = "java"
  spec.description = "ActiveMQ topic subscriber for testing convenience"
  spec.summary = "ActiveMQ topic subscriber"
  spec.name = "activemq_subscriber"
  spec.version = "1.0.0"
  spec.require_path = "."
  spec.rdoc_options = rdoc_opts
  spec.files = files
  spec.test_files = Dir.glob('unit_tests/*')
  spec.add_dependency "jruby-activemq"
end

Gem::PackageTask.new(update_spec) do |spec|
end
