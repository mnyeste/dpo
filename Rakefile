require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.options = '-v'
  t.libs << 'test'
  t.pattern = "test/*_test.rb"
end

#Rake::TestTask.new do |t|
#  t.options = '-v'
#  t.libs << 'spec'
#  t.pattern = "spec/*_spec.rb"
#end