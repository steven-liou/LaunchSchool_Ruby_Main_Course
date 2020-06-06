# before and after - sandwhich code

def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(2) }

time_it { "hello world" }