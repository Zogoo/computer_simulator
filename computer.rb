require './core/stack_memory'
require './core/executor'

class Computer
  attr_accessor :stack, :start_address

  def initialize(size)
    self.stack = Core::StackMemory.new(size)
  end

  def insert(command, param = nil)
    # TODO: Add validation stack size and commands parameters.
    # TODO: Stack size could be dynamically increased when use wanted to add more commands.
    stack.insert(command, param)
    self
  end

  def set_address(address)
    # TODO: Add validation that check address always inside of stack size.
    # FIXME: Remove duplication of address storage if execute could get address directly
    self.start_address = address
    stack.set_address(address)
    self
  end

  def execute
    # TODO: Need to clarify why you need to set address for execution instead of directly set into execute method
    executor = Core::Executor.new(stack)
    executor.execute(start_address)
  end
end
