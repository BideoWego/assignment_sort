def benchmark(array, n=100)
  puts "\n\nReady. Set. Sort!"
  puts array.length > 100 ? "Given: #{array}"[0..100] + " ..." : "Given: #{array}"
  results = {}
  [
    :bubble_sort,
    :select_sort,
    :insert_sort,
    :merge_sort,
    :quick_sort,
    :count_sort,
    :radix_sort
  ].each do |m|
    before = Time.now
    n.times do
      send(m, array)
    end
    results[m] = Time.now - before
  end
  sorted = {}
  results.values.sort.each do |value|
    sorted[results.key(value)] = value
  end
  sorted
end