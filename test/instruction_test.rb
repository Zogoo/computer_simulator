require_relative '../core/instruction'
require_relative './test_helper'

def instruction_test
  puts 'Instruction test'
  puts '#initialize'
  stack_memory = Core::Instruction.new
  expect(stack_memory.data.is_a?(Array), 'will initialize frame data as array')

  puts '#handle'
  stack_memory.handle({ cmd: 'PUSH', param: 2 })
  expect(stack_memory.data == [2], 'will store in frame data')
  stack_memory.handle({ cmd: 'PRINT', param: nil })
  print "print 2 in console\n"
  puts '-----------------'
end
