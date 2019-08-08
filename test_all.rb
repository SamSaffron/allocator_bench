pwd = `pwd`.strip

ENV.delete 'LD_PRELOAD'
ENV.keys.each do |k|
  if k =~ /^RUBY_/
    ENV.delete k
  end
end

puts `ruby --version`
mem,duration = `ruby stress_mem.rb`.strip.split(",")
puts "built-in mem: #{mem} duration: #{duration}"

mem,duration = `MALLOC_ARENA_MAX=2 ruby stress_mem.rb`.strip.split(",")
puts "built-in mem (MALLOC_ARENA_MAX=2): #{mem} duration: #{duration}"

mem,duration = `LD_PRELOAD=#{pwd}/mimalloc_lib/libmimalloc.so ruby stress_mem.rb`.strip.split(",")
puts "mimalloc master: #{mem} duration: #{duration}"

mem,duration = `LD_PRELOAD=#{pwd}/rpmalloc_lib/librpmallocwrap.so ruby stress_mem.rb`.strip.split(",")
puts "rpmalloc master: #{mem} duration: #{duration}"

Dir["tcmalloc_lib/*"].sort.each do |path|
  mem,duration = `LD_PRELOAD=#{pwd}/#{path}/lib/libtcmalloc_minimal.so ruby stress_mem.rb`.strip.split(",")
  puts "#{path.gsub('_lib/', ' ')} mem: #{mem} duration: #{duration}"
end

Dir["jemalloc_lib/*"].sort.each do |path|
  mem,duration = `LD_PRELOAD=#{pwd}/#{path}/lib/libjemalloc.so ruby stress_mem.rb`.strip.split(",")
  puts "#{path.gsub('_lib/', ' ')} mem: #{mem} duration: #{duration}"
end

mem,duration = `LD_PRELOAD=#{pwd}/lockless_allocator/libllalloc.so.1.4 ruby stress_mem.rb`.strip.split(",")
puts "lockless 1.4 mem: #{mem} duration: #{duration}"

mem,duration = `LD_PRELOAD=#{pwd}/Hoard/src/libhoard.so ruby stress_mem.rb`.strip.split(",")
puts "Hoard HEAD mem: #{mem} duration: #{duration}"

