require 'core/instruction'

module Core
  class Executor
    attr_accessor :stack, :pointer

    def initialize(stack)
      self.stack = stack
      self.pointer = 0
    end

    def execute
      Instruction.new(stack[pointer])
    end
  end
end