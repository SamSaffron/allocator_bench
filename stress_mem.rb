@retained = []

SEED=1
MAX_STRING_SIZE = 100
RAND = Random.new(SEED)
LARGE_ALLOC_MAX_SIZE = 100_000


def stress(allocate_count, retain_count, chunk_size)
  chunk = []
  while retain_count > 0 || allocate_count > 0
    if retain_count == 0 || (RAND.rand < 0.5 && allocate_count > 0)
      chunk << " " * RAND.rand(MAX_STRING_SIZE)
      allocate_count -= 1
      if chunk.length > chunk_size
        chunk = [" " * RAND.rand(LARGE_ALLOC_MAX_SIZE)]
      end
    else
      @retained << " " * Random.rand(MAX_STRING_SIZE)
      retain_count -= 1
    end
  end
end

start = Time.now

threads = [1, ENV["STRESS_THREADS"].to_i].max

(0...threads).map do
  Thread.new do
    stress(12_000_000/threads, 600_000/threads, 200_000/threads)
  end
end.each(&:join)

duration = (Time.now - start).to_f

_, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
puts "#{size},#{duration}"
