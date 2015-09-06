def bubble_sort(array)
	sorted_length = 0
	begin
		unsorted_length = array.length - sorted_length
		swapped = false
		unsorted_length.times do |i|
			left, right = array[i], array[i + 1]
			if right && right < left
				array[i], array[i + 1] = right, left
				swapped = true
			end
		end
		sorted_length += 1
	end while swapped
	array
end

def select_sort(array)
	sorted_length = 0
	while (sorted_length < array.length - 1)
		min = Float::INFINITY
		min_index = 0
		sorted_length.upto(array.length - 1) do |i|
			min, min_index = array[i], i if min > array[i]
		end
		array[sorted_length], array[min_index] = array[min_index], array[sorted_length]
		sorted_length += 1
	end
	array
end

def insert_sort(array)
	i = 0
	while (i < array.length - 1)
		j = i + 1
		while (j > 0)
			right = array[j]
			left = array[j - 1]
			if right < left
				array[j], array[j - 1] = left, right
			end
			j -= 1
		end
		i += 1
	end
	array
end

def merge_sort(array)
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
		l = left[0]
		r = right[0]
		merge_from = nil
		if l && r
			merge_from = (r < l) ? right : left
		elsif l
			merge_from = left
		elsif r
			merge_from = right
		end
		merged << merge_from.shift if merge_from
	end until left.empty? && right.empty?
	merged
end

def quick_sort(array)
	partition = lambda do |array, lo, hi|
		pivot = array[hi]
		i = lo
		lo.upto(hi - 1) do |j|
			if array[j] <= pivot
				array[i], array[j] = array[j], array[i]
				i += 1
			end
		end
		array[i], array[hi] = array[hi], array[i]
		i
	end

	qs = lambda do |array, lo, hi|
		if lo < hi
			p = partition.call(array, lo, hi)
			qs.call(array, lo, p - 1)
			qs.call(array, p + 1, hi)
		end
	end

	lo = 0
	hi = array.length - 1
	qs.call(array, lo, hi)

	array
end

def count_sort(array)
	keys = {}
	array.each do |i|
		keys[i] = 0 unless keys[i]
		keys[i] += 1
	end

	keys = keys.sort.to_h

	i = 0
	keys.each do |key, value|
		value.times do
			array[i] = key
			i += 1
		end
	end

	array
end

def radix_sort(array)
	queues = Array.new(10) {[]}

	char_index = 0
	no_chars = false

	until (no_chars)
		chars = []
		
		i = 0
		while (i < array.length)
			value = array[i].to_s
			char = value.reverse[char_index]
			if char
				queues[char.to_i].push(array[i])
				chars.push(char)
			else
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
				array[k] = q.shift
				k += 1
				j += 1
			end
			i += 1
		end

		no_chars = chars.empty?
		char_index += 1
	end

	array
end


