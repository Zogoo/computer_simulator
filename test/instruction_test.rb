require_relative './test_helper'
require_relative '../core/instruction'

def instruction_test
  puts 'Instruction test'
  puts '#initialize'
  stack_memory = Core::Instruction.new
  expect(stack_memory.data.is_a?(Array), '#new will initialize frame data as array')

  puts '#handle'
  puts 'when execute allowed commands'
  stack_memory.handle({ cmd: 'PUSH', param: 2 })
  expect(stack_memory.data == [2], 'PUSH will store command into frame data')
  stack_memory.handle({ cmd: 'PRINT', param: nil })
  print "PRINT command will print out previous pushed data '2' in console\n"
  puts '-----------------'

  puts '#handle validation'
  puts 'when handle uknown command'
  should_raise_error(ArgumentError) do
    stack_memory.handle({ cmd: 'HELP', param: 'ME' })
  end

  puts 'when handle command with empty param'
  should_raise_error(ArgumentError) do
    stack_memory.handle({ cmd: 'CALL', param: nil })
  end
  puts '-----------------'
end
