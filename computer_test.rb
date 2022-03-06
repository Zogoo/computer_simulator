require './test/test_helper'
require './test/stack_memory_test'
require './test/instruction_test'
require './test/executor_test'
require './computer'

# require 'byebug'

MAIN_BEGIN = 0
PRINT_TENTEN_BEGIN = 50

def main
  # Create new computer with a stack of 100 addresses
  computer = Computer.new(100)
  # Instructions for the print_tenten function
  computer.set_address(PRINT_TENTEN_BEGIN).insert('MULT').insert('PRINT').insert('RET')
  # The start of the main function
  computer.set_address(MAIN_BEGIN).insert('PUSH', 1009).insert('PRINT')
  # Return address for when print_tenten function finishes
  computer.insert('PUSH', 6)
  # Setup arguments and call print_tenten
  computer.insert('PUSH', 101).insert('PUSH', 10).insert('CALL', PRINT_TENTEN_BEGIN)
  # Stop the program
  computer.insert('STOP')
  computer.set_address(MAIN_BEGIN).execute
end

# Unit test
stack_memory_test

# Instruction test
instruction_test

# Executor test
executor_test

# Integration test from Coding challenge
puts 'Main test, should not raise any issue'

should_not_raise_any_error do
  main
end

# TODO: Add more test with combinitation of allowed commands. And fix bugs & issues.

# TODO: Add more corner cases like try to execute commands when there is no frame data.
