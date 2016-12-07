pwd = `pwd`.strip

puts `ruby --version`
mem,duration = `ruby stress_mem.rb`.strip.split(",")
puts "built-in mem: #{mem} duration: #{duration}"

mem,duration = `LD_PRELOAD=#{pwd}/Hoard/src/libhoard.so ruby stress_mem.rb`.strip.split(",")
puts "Hoard 3.12 mem: #{mem} duration: #{duration}"

mem,duration = `LD_PRELOAD=#{pwd}/lockless_allocator/libllalloc.so.1.3 ruby stress_mem.rb`.strip.split(",")
puts "lockless 1.3 mem: #{mem} duration: #{duration}"

Dir["tcmalloc_lib/*"].sort.each do |path|
  mem,duration = `LD_PRELOAD=#{pwd}/#{path}/lib/libtcmalloc_minimal.so ruby stress_mem.rb`.strip.split(",")
  puts "#{path.gsub('_lib/', ' ')} mem: #{mem} duration: #{duration}"
end

Dir["jemalloc_lib/*"].sort.each do |path|
  mem,duration = `LD_PRELOAD=#{pwd}/#{path}/lib/libjemalloc.so ruby stress_mem.rb`.strip.split(",")
  puts "#{path.gsub('_lib/', ' ')} mem: #{mem} duration: #{duration}"
end
