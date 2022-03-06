def expect(result, msg, failed_result = '')
  raise "Expected: #{msg}, but failed: #{failed_result}" unless result

  puts "#{msg}\n"
end

def should_not_raise_any_error
  yield
  puts 'it will not raise any error'
rescue => e
  raise "Expected to not raise any issue, but it raised #{e.message} \n"
end

def should_raise_error(clazz)
  begin
    yield
  rescue => e
    expect(e.instance_of?(clazz), "will raise #{clazz}")
  end
end
