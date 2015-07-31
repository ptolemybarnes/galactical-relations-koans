module RakeHelpers
  def remove_default_spec_task
    Rake.application['default'].prerequisites.delete('spec') 
  end
end

include RakeHelpers
remove_default_spec_task

task :default => 'galaxy:run'

namespace :galaxy do
  task :run do
    puts "Expanding the galaxy..." + "\n" * 3

    Rake::Task['galaxy:alpha'].invoke # if this passes, run beta
    Rake::Task['galaxy:beta'].invoke 
    Rake::Task['galaxy:gamma'].invoke 
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:alpha) do |t|
    puts "DESCRIPTION OF STAGE ALPHA"
    puts

    t.rspec_opts = '--tag stage:alpha'
  end

  RSpec::Core::RakeTask.new(:beta) do |t|
    puts "DESCRIPTION OF STAGE BETA"
    puts

    t.rspec_opts = '--tag stage:beta'
  end

  RSpec::Core::RakeTask.new(:gamma) do |t|
    puts "DESCRIPTION OF STAGE GAMMA"
    puts

    t.rspec_opts = '--tag stage:gamma'
  end

end



