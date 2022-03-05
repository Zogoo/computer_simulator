module Core
  module InstructionValidator
    def validate_instruction!(whitelist, input)
      raise ArgumentError, "Unsupported command: #{input}" unless whitelist.include?(input)
    end

    def validate_param!(command, param)
      raise ArgumentError, "Parameter required: #{command}" if %w[CALL PUSH].include?(command) && param.nil?
    end
  end
end
