require 'core/instruction_validator'
module Core
  class Instruction
    InstructionError = Class.new(StandardError)

    INSTRUCTIONS = %w[MULT CALL RET STOP PRINT PUSH].freeze

    def initialize(command = { cmd: '', param: '' })
      InstructionValidator.validate_instruction!(INSTRUCTIONS, command[:cmd])
      InstructionValidator.validate_param!(command[:cmd], command[:param])
    end

    def 

    private

    def multiple(a, b)
      a * b
    end

    def call(pointer)
      arg_pointer = pointer
      3.times do 
        arg_pointer -= 1
        raise InstructionError.new('Please set required params before use CALL instruction') unless stack[arg_pointer][:cmd] == 'PUSH'
      end
    end

    def return_back(pointer)
      pointer
    end

    def stop

    end

    def push
    end
  end
end
