#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'bundler/setup'

require 'prose_mirror'

require 'opal/rspec/rake_task'
Opal.append_path File.expand_path('../spec_opal', __FILE__)
Opal::RSpec::RakeTask.new(:spec_opal) do |server, task|
  server.append_path 'spec_opal/vendor'
  task.files = FileList['spec_opal/**/*_spec.rb']
end

task :default => [:spec_opal]
