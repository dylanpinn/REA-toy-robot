# frozen_string_literal: true

begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
  RSpec::Core::RakeTask.new(:spec)
  require 'reek/rake/task'

  Reek::Rake::Task.new do |t|
    t.fail_on_error = false
  end

  task default: :spec
rescue LoadError
  p 'No rspec available'
end
