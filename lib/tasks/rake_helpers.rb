module RakeHelpers
  def remove_default_spec_task
    Rake.application['default'].prerequisites.delete('spec') 
  end
end


