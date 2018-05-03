@pwd = `pwd`.strip

unless Dir.exist? 'gperftools'
  puts "Checking out initial source"
  `git clone https://github.com/gperftools/gperftools.git`
end


def build_tag(tag)
  prefix = "#{@pwd}/tcmalloc_lib/#{tag.gsub("gperftools-", "")}"
  `mkdir -p #{prefix}`
  `cd gperftools && rm -fr .gitignore && git clean -f && git reset --hard && git checkout #{tag} && ./autogen.sh && ./configure --prefix=#{prefix} && cd -`

  if tag =~ /2\.0/
    patch = File.read("gperftools/src/base/linuxthreads.cc")
    patch.gsub!("static void SignalHandler(int signum, siginfo_t *si, void *data)", "static void SignalHandler(int signum, siginfo *si, void *data)")
    File.write("gperftools/src/base/linuxthreads.cc", patch)
  end

  `cd gperftools && make install && cd -`
end


build_tag("gperftools-2.0")
build_tag("gperftools-2.1")
build_tag("gperftools-2.2")
build_tag("gperftools-2.3")
build_tag("gperftools-2.4")
build_tag("gperftools-2.5")
build_tag("gperftools-2.6")
build_tag("gperftools-2.6.1")
build_tag("gperftools-2.6.2")
build_tag("gperftools-2.6.3")
build_tag("gperftools-2.7")



