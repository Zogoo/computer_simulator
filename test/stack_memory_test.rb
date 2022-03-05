require_relative '../core/stack_memory'
require_relative './test_helper'

def stack_memory_test
  puts 'StackMemory test'
  puts '#initialize'
  stack_memory = Core::StackMemory.new(10)
  expect(stack_memory.stack_memory.is_a?(Array), 'will initialize stack memory with array')
  expect(stack_memory.stack_memory.size == 11, 'stack memory size will be 11')
  expect(stack_memory.pointer.zero?, 'will initialize pointer with 0')
  expect(stack_memory.address.nil?, 'will initialize address with nil')

  puts '#insert'
  stack_memory.insert('ANY', 2)
  expect(stack_memory.pointer == 1, 'will increase pointer')
  expect(stack_memory.stack_memory.first[:cmd] == 'ANY', 'will store it in hash with cmd key')
  expect(stack_memory.stack_memory.first[:param] == 2, 'will store it in hash with param value')

  puts '#set_address'
  stack_memory.set_address(4)
  stack_memory.insert('ANY', 2)
  expect(stack_memory.stack_memory[4][:cmd] == 'ANY', 'will store command in given address')
  puts '-----------------'
end
