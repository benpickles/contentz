require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "contentz"
    gem.summary = 'Contentz (pronounced "content zee") is an ActiveRecord extension that uses Zlib to compress/uncompress attribute data on write/read.'
    gem.email = "spideryoung@gmail.com"
    gem.homepage = "http://github.com/benpickles/contentz"
    gem.authors = ["Ben Pickles"]
    gem.add_dependency "activerecord"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "contentz #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require File.join(File.dirname(__FILE__), 'test', 'config')

namespace :db do
  desc 'Build the MySQL test database.'
  task :build do
    `mysqladmin -u #{DB_USER} create #{DB_NAME}`
  end

  desc 'Drop the MySQL test database.'
  task :drop do
    `mysqladmin -u #{DB_USER} -f drop #{DB_NAME}`
  end

  desc 'Rebuild the MySQL test databases'
  task :rebuild => [:drop, :build]
end
