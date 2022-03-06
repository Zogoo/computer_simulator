require_relative './test_helper'
require_relative '../core/instruction_validator'

include Core::InstructionValidator

def instruction_validator_test
  puts '#validate_instruction!'
  puts 'when instruction inlcude in whitelist'
  should_not_raise_any_error do
    validate_instruction!(%w[CALL PUSH], 'CALL')
  end
  puts 'when instruction not inlcuded in whitelist'
  should_raise_error(ArgumentError) do
    validate_instruction!(%w[CALL PUSH], 'LOOP')
  end

  puts '#validate_param!'
  puts 'when instruction inlcude in whitelist with param'
  should_not_raise_any_error do
    validate_param!(%w[CALL], 'CALL', 50)
  end
  puts 'when instruction inlcuded in whitelist without param'
  should_raise_error(ArgumentError) do
    validate_param!(%w[CALL], 'CALL', nil)
  end
  puts '-----------------'
end
