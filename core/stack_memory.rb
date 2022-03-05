module Core
  class StackMemory
    attr_accessor :stack_memory
    attr_reader :pointer, :address

    def initialize(size)
      self.stack_memory = Array.new(size + 1)
      self.pointer = 0
      self.address = nil
    end

    def insert(command, param)
      if address.present?
        stack_memory[address] = { cmd: command, param: param }
        self.address += 1
      else
        stack_memory[pointer] = { cmd: command, param: param }
        self.pointer += 1
      end
      self
    end

    def set_address(address)
      self.address = address
      self
    end
  end
end
