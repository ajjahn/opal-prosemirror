#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'bundler/setup'
require 'opal-prosemirror'

require 'opal/rspec/rake_task'
Opal.append_path File.expand_path('../spec_opal', __FILE__)
Opal::RSpec::RakeTask.new(:spec_opal) do |server, task|
  task.files = FileList['spec_opal/**/*_spec.rb']
end

task :default => [:spec_opal]
