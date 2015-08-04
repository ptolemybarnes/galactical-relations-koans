module RakeHelpers
  def remove_default_spec_task
    Rake.application['default'].prerequisites.delete('spec') 
  end
end

class String

  def colourize
    "\033[1;31m#{self}\033[0m...\n"
  end

  def space(value)
    spaces = "\n" * value
    spaces + self + spaces
  end

end

