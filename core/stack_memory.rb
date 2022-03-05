module Core
  class StackMemory
    attr_accessor :stack_memory
    attr_reader :pointer, :address

    def initialize(size)
      self.stack_memory = Array.new(size + 1)
      @pointer = 0
      @address = nil
    end

    def insert(command, param)
      if !address.nil?
        stack_memory[address] = { cmd: command, param: param }
        @address += 1
      else
        stack_memory[pointer] = { cmd: command, param: param }
        @pointer += 1
      end
    end

    def set_address(address)
      @address = address
    end
  end
end
