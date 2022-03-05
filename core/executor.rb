require 'core/instruction'

module Core
  class Executor
    attr_accessor :stack, :pointer

    def initialize(stack)
      self.stack = stack
      self.pointer = 0
    end

    def execute(pointer, data)
      instruction = Instruction.new(data)
      ret = instruction.handle(stack[pointer])
      return if ret == Instruction::STOP

      execute(stack[ret], instruction.data) if ret.is_a?(Integer)
      self.pointer += 1
    end
  end
end
