@pwd = `pwd`.strip

unless Dir.exist? 'rpmalloc'
  puts "Checking out initial source"
  `git clone https://github.com/mjansson/rpmalloc.git`
end

def build_master
  `mkdir -p #{@pwd}/rpmalloc_lib`
  Dir.chdir("rpmalloc") do
    `python configure.py -c release`
    `ninja`
    `cp bin/linux/release/x86-64/librpmallocwrap.so ../rpmalloc_lib`
  end
end

build_master

