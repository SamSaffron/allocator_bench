@pwd = `pwd`.strip

unless Dir.exist? 'jemalloc'
  puts "Checking out initial source"
  `git clone https://github.com/jemalloc/jemalloc`
end

tags = `cd jemalloc && git tag && cd -`.split("\n")

def build_tag(tag)
  `mkdir -p #{@pwd}/jemalloc_lib/#{tag}`
  `cd jemalloc && git clean -f && git checkout #{tag} && autoconf && ./configure --prefix=#{@pwd}/jemalloc_lib/#{tag} && make install && git clean -f && cd -`
end

tags.each do |t|
  build_tag(t) if t > "2.2.5"
end



