require 'core/stack_memory'

class Computer
  attr_accessor :stack

  def initialize(size)
    self.stack = Core::StackMemory.new(size)
  end
end
