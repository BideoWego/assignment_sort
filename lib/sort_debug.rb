def bubble_sort(array)
	puts "-- Bubble Sort --"
	count = 0

	puts "#{array.inspect}"

	sorted_length = 0
	begin
		unsorted_length = array.length - sorted_length
		swapped = false

		puts "Unsorted length(#{unsorted_length}) > 1: #{unsorted_length > 1}"

		unsorted_length.times do |i|
			left = array[i]
			right = array[i + 1]
			if right && right < left
				array[i], array[i + 1] = right, left
				swapped = true

				puts "Swapping: #{right}<->#{left}"

			end

			puts "#{count}: #{array.inspect}"
			count += 1

		end

		puts "Swapped?: #{swapped}"

		sorted_length += 1
	end while swapped

	puts "#{array.inspect}"

	array
end

def select_sort(array)
	puts "-- Select Sort --"
	count = 0

	puts "#{array.inspect}"

	sorted_length = 0
	while (sorted_length < array.length - 1)

		puts "Sorted length(#{sorted_length}) < n - 1(#{array.length - 1}): #{sorted_length < array.length - 1}"

		min = Float::INFINITY
		min_index = 0
		sorted_length.upto(array.length - 1) do |i|
			min, min_index = array[i], i if min > array[i]

			puts "#{count}: #{array.inspect}"
			count += 1

		end
		array[sorted_length], array[min_index] = array[min_index], array[sorted_length]

		puts "Swapping: #{array[sorted_length]}<->#{array[min_index]}"

		sorted_length += 1
	end

	puts "#{array.inspect}"

	array
end

def insert_sort(array)
	puts "-- Insert Sort --"
	count = 0

	puts "#{array.inspect}"

	i = 0
	while (i < array.length - 1)

		puts "i(#{i}) < n - 1(#{array.length - 1})"

		j = i + 1
		while (j > 0)

			puts "j(#{j}) > 0"

			right = array[j]
			left = array[j - 1]
			if right < left
				array[j], array[j - 1] = left, right

				puts "Swapping: #{right}<->#{left}"

			end
			j -= 1

			puts "#{count}: #{array.inspect}"
			count += 1

		end
		i += 1
	end

	puts "#{array.inspect}"

	array
end

$merge_sort_counter = 0
$merge_sort_length = -1

def merge_sort(array)
	if $merge_sort_length == -1
		$merge_sort_length = array.length
		puts "-- Merge Sort --"
		puts "#{array.inspect}"
	end

	return array if array.length <= 1
	right_lower_bound = left_upper_bound = middle = array.length / 2
	if array.length.even?
		left_upper_bound -= 1
	else
		right_lower_bound += 1
	end
	left = merge_sort(array[0..left_upper_bound])
	right = merge_sort(array[right_lower_bound..array.length])

	merged = []

	begin

		puts "#{$merge_sort_counter}:"
		puts "Left: #{left.inspect}"
		puts "Right: #{right.inspect}"

		l = left[0]
		r = right[0]
		merge_from = nil

		puts "Comparing: #{r} < #{l}"

		if l && r
			merge_from = (r < l) ? right : left
		elsif l
			merge_from = left
		elsif r
			merge_from = right
		end

		if merge_from
			puts "Merging #{merge_from[0]}"
			merged << merge_from.shift
		end

		puts "Merged: #{merged.inspect}"
		$merge_sort_counter += 1

	end until left.empty? && right.empty?

	puts "Left: #{left.inspect}, Right: #{right.inspect} empty"
	if merged.length == $merge_sort_length
		$merge_sort_counter = 0
		$merge_sort_length = -1
		puts "#{merged.inspect}"
	end

	merged
end

def quick_sort(array)

	count = 0

	partition = lambda do |array, lo, hi|

		puts "Array: #{array.inspect}"
		puts "Partitioning: #{array[lo..hi].inspect}"

		pivot = array[hi]

		puts "Pivot: #{pivot}"

		i = lo
		lo.upto(hi - 1) do |j|

			puts "#{count}:"
			puts "Looking to swap: #{array[i]}"
			count += 1

			if array[j] <= pivot

				puts "#{array[j]} <= pivot(#{pivot})"
				puts "Swapping: #{array[i]}<->#{array[j]}"

				array[i], array[j] = array[j], array[i]

				puts "=> #{array.inspect}"

				i += 1
			else

				puts "#{array[j]} > pivot(#{pivot})"

			end
		end

		puts "Swapping: #{array[i]}<->pivot(#{array[hi]})"

		array[i], array[hi] = array[hi], array[i]

		puts "=> #{array.inspect}"

		puts "Returning pivot index: #{i}"

		i
	end

	qs = lambda do |array, lo, hi|
		if lo < hi

			puts "Low(#{lo}) < High(#{hi})"

			p = partition.call(array, lo, hi)

			puts "Attempting to sort left: #{lo} to #{p - 1}"

			qs.call(array, lo, p - 1)

			puts "Attempting to sort right: #{p + 1} to #{hi}"

			qs.call(array, p + 1, hi)
		else

			puts "Low(#{lo}) >= High(#{hi})"

		end
	end

	puts "-- Quick Sort --"
	puts "#{array.inspect}"

	lo = 0
	hi = array.length - 1
	qs.call(array, lo, hi)

	array
end

def count_sort(array)
	puts "-- Count Sort --"
	puts "#{array.inspect}"

	count = 0

	keys = {}
	array.each do |i|

		puts "#{count}:"
		count += 1

		keys[i] = 0 unless keys[i]
		keys[i] += 1

		puts "Incrementing key(#{i}): #{keys[i]}"

	end

	puts "Keys: #{keys.inspect}"

	keys = keys.sort.to_h

	puts "Sorted keys: #{keys.inspect}"

	i = 0
	keys.each do |key, value|
		value.times do

			puts "#{count}:"
			count += 1

			puts "Array: #{array.inspect}"
			puts "Swapping: #{array[i]}<->key(#{key})"

			array[i] = key
			i += 1

			puts "=> #{array.inspect}"

		end
	end

	puts "#{array.inspect}"

	array
end

def radix_sort(array)
	puts "-- Radix Sort --"

	queues = Array.new(10) {[]}

	puts "Creating 10 queues for 0 - 9 digits: #{queues.inspect}"

	char_index = 0
	no_chars = false

	puts "Char index: #{char_index}"
	puts "No chars found: #{no_chars}"
	count = 0

	until (no_chars)
		chars = []

		i = 0
		while (i < array.length)

			puts "#{count}:"
			count += 1

			value = array[i].to_s

			puts "Value: #{value}"

			char = value.reverse[char_index]

			puts "Char: #{char}"

			if char =~ /[0-9]/

				puts "Char found"
				puts "Pushing #{array[i]} onto queue #{char.to_i}"

				queues[char.to_i].push(array[i])
				chars.push(char)
			else

				puts "No char found"
				puts "Pushing #{array[i]} onto queue 0"

				queues[0].push(array[i])
			end
			i += 1
		end

		i = 0
		k = 0
		while (i < queues.length)
			q = queues[i]
			j = 0
			until (q.empty?)

				puts "Queues: #{queues.inspect}"
				puts "#{count}:"
				count += 1
				puts "Shifting from queue: #{i} to array[#{k}]"

				array[k] = q.shift

				puts "Array: #{array.inspect}"

				k += 1
				j += 1
			end
			i += 1
		end

		no_chars = chars.empty?
		char_index += 1
	end

	i = 0
	while (i < array.length)

		puts "#{count}:"
		count += 1

		if array[i] < 0

			puts "Slicing and prepending: #{array[i]}"

			value = array.slice!(i)
			array.unshift(value)

			puts "Array: #{array.inspect}"

		end
		i += 1
	end

	puts "#{array.inspect}"

	array
end
