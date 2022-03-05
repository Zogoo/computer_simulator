require './core/instruction'

module Core
  class Executor
    attr_accessor :stack

    def initialize(stack)
      self.stack = stack
    end

    def execute(pointer, data = nil)
      instruction = Instruction.new(data)
      ret = instruction.handle(stack.stack_memory[pointer])
      return if ret == Instruction::STOP

      pointer += 1
      execute(ret.is_a?(Integer) ? ret : pointer, instruction.data)
    end
  end
end
