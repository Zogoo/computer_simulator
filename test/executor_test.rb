require_relative './test_helper'
require_relative '../core/executor'

def executor_test
  puts '#initialize'
  executor = Core::Executor.new(1)
  expect(executor.stack == 1, 'will assign argument in to instance variable')

  puts '#execute'
  commands = [
    { cmd: 'PUSH', param: 3 },
    { cmd: 'PUSH', param: 5 },
    { cmd: 'MULT', param: nil },
    { cmd: 'PRINT', param: nil },
    { cmd: 'STOP', param: nil }
  ]
  stack = Core::StackMemory.new(10)
  stack.stack_memory = commands
  executor = Core::Executor.new(stack)
  puts 'when pass valid sequence of commands'
  should_not_raise_any_error do
    puts 'will execute those commands without error'
    executor.execute(0)
  end
  puts '-----------------'
end
