require 'core/instruction_validator'
module Core
  class Instruction
    INSTRUCTIONS = %w[MULT CALL RET STOP PRINT PUSH].freeze
    STOP = 'stop'.freeze

    attr_accessor :command, :param, :data

    def initialize(data = [])
      self.data = data
    end

    def handle(command = { cmd: '', param: '' })
      InstructionValidator.validate_instruction!(INSTRUCTIONS, command[:cmd])
      InstructionValidator.validate_param!(command[:cmd], command[:param])
      case command[:cmd]
      when 'MULT'
        multiple
      when 'PUSH'
        data_push(command[:param])
      when 'PRINT'
        data_print
      when 'RET'
        return_back
      when 'CALL'
        call
      when 'STOP'
        stop
      end
    end

    private

    def multiple
      data.push(data.pop * data.pop)
    end

    def call
      command[:param]
    end

    def return_back
      data.pop
    end

    def stop
      Instruction::STOP
    end

    def data_push(param)
      data.push(param)
    end

    def data_print
      puts data.pop
    end
  end
end
