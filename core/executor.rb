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
      # TDOO: Add debug printing with debug logic
      # puts "data: #{data}"
      # puts "command: #{stack.stack_memory[pointer]}"
      # TODO: Raise if pointer point to empty (nil) stack
      ret = instruction.handle(stack.stack_memory[pointer])
      # FIXME: finish also recursion when execute all commands or pointer get higher than stack size
      return if ret == Instruction::STOP

      pointer += 1
      # TODO: Detect and raise when next command is empty (nil)
      # byebug if stack.stack_memory[pointer].nil? || (ret.is_a?(Integer) && stack.stack_memory[ret].nil?)
      execute(ret.is_a?(Integer) ? ret : pointer, instruction.data)
    end
  end
end
