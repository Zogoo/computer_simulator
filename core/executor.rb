require './core/instruction'

module Core
  class Executor
    attr_accessor :stack

    def initialize(stack)
      # TODO: Add validation that stack is the StackMemory object
      self.stack = stack
    end

    def execute(pointer, data = nil)
      # TODO: Support local frame data, right now it uses data as global data but local data should not affect to upper level
      instruction = Instruction.new(data)
      ret = instruction.handle(stack.stack_memory[pointer])
      # FIXME: finish also recursion when execute all commands or pointer get higher than stack size
      return if ret == Instruction::STOP

      pointer += 1
      execute(ret.is_a?(Integer) ? ret : pointer, instruction.data)
    end
  end
end
