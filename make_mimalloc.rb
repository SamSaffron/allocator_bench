@pwd = `pwd`.strip

unless Dir.exist? 'mimalloc'
  puts "Checking out initial source"
  `git clone https://github.com/microsoft/mimalloc.git`
end

def build_master
  `mkdir -p #{@pwd}/mimalloc_lib`
  Dir.chdir("mimalloc") do
    `mkdir -p out/release`
    Dir.chdir("out/release") do
      `cmake ../..`
      `make`
      `cp libmimalloc.so ../../../mimalloc_lib`
    end
  end
end

build_master

