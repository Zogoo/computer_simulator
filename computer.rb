require 'core/stack_memory'
require 'core/executor'

class Computer
  attr_accessor :stack

  def initialize(size)
    self.stack = Core::StackMemory.new(size)
  end

  def insert(command, param)
    stack.insert(command, param)
    self
  end

  def set_address(address)
    stack.set_address(address)
    self
  end

  def execute
    Core::Executor.new(stack)
  end
end
