require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "deadlinez"
    gem.summary = %Q{Makes it easy to handle After the Deadline AJAX proxying and their API.}
    gem.description = %Q{Makes it easy to handle After the Deadline AJAX proxying and their API.}
    gem.email = "david@bitwax.cd"
    gem.homepage = "http://github.com/dbalatero/deadlinez"
    gem.authors = ["David Balatero"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "fakeweb"
    gem.add_dependency 'httparty'
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "deadlinez #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end