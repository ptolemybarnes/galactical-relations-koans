module RakeHelpers
  def remove_default_spec_task
    Rake.application['default'].prerequisites.delete('spec') 
  end
end

include RakeHelpers
remove_default_spec_task

task :default => 'galactical_koans'

task :galactical_koans do
  puts "Expanding the galaxy..." + "\n" * 3

  Rake::Task['run_stage_alpha'].invoke
  # if the above pass, run stage beta...
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:run_stage_alpha) do |t|
  puts "DESCRIPTION OF STAGE ALPHA"
  t.rspec_opts = '--tag stage:alpha'
end



