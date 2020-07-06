@pwd = `pwd`.strip

unless Dir.exist? 'jemalloc'
  puts "Checking out initial source"
  `git clone https://github.com/jemalloc/jemalloc`
end

tags = `cd jemalloc && git tag && cd -`.split("\n")

def build_tag(tag)
  p "Branch with tag: #{tag}"
  `mkdir -p #{@pwd}/jemalloc_lib/#{tag}`
  `cd jemalloc && git clean -f && git checkout #{tag} && autoconf && ./configure --prefix=#{@pwd}/jemalloc_lib/#{tag} && make && make install_bin install_include install_lib && make relclean && git clean -f && cd -`
end

tags.each do |t|
  build_tag(t) if t > "3.5.0"
end
