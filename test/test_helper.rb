def should_not_raise_any_error
  yield
rescue => e
  raise "Expected to not raise any issue, but it raised #{e.message} \n"
end

def expect(result, msg, failed_result = '')
  raise "Expected: #{msg}, but failed: #{failed_result}" unless result

  puts "#{msg}\n"
end
