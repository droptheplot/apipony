begin
  require 'bundler/setup'
  require 'yard'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

YARD::Rake::YardocTask.new(:doc) {}

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test
