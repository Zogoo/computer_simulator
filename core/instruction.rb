require './core/instruction_validator'

module Core
  class Instruction
    include InstructionValidator

    SINGLE_INSTRUCTION = %w[MULT PRINT PUSH STOP RET].freeze
    PARAM_INSTRUCTION = %w[CALL].freeze
    STOP = 'stop'.freeze

    attr_accessor :data

    def initialize(data = [])
      self.data = data || []
    end

    def handle(command = { cmd: '', param: '' })
      validate_instruction!(SINGLE_INSTRUCTION + PARAM_INSTRUCTION, command[:cmd])
      validate_param!(PARAM_INSTRUCTION, command[:cmd], command[:param])

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
        call(command[:param])
      when 'STOP'
        stop
      end
    end

    private

    def multiple
      data.push(data.pop * data.pop)
    end

    def call(call_pointer)
      call_pointer
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
