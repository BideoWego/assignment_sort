# ----------------------------------------
# Bubble Sort
# ----------------------------------------

def bubble_sort(array)

  # unsorted length begins as full length
  unsorted_length = array.length

  # swapped must begin true
  swapped = true

  # while we made a swap
  while swapped

    # assume no swap was made
    swapped = false

    # for each index in the unsorted length
    unsorted_length.times do |index|

      # get the current and next value
      a = array[index]
      b = array[index + 1]

      # if the next value is not nil
      # and the current is greater than
      # the next value
      if b && a > b

        # swap the values
        array[index] = b
        array[index + 1] = a

        # swapped is true
        # so we iterate again
        swapped = true
      end
    end

    # decrement unsorted length
    # since bubble sort makes
    # n-1 of unsorted length
    # sorted
    unsorted_length -= 1
  end

  # return array of course
  array
end


# ----------------------------------------
# Select Sort
# ----------------------------------------

def select_sort(array)

  # sorted length begins at first index
  sorted_length = 0

  # store the length of the array
  n = array.length

  # while we have an unsorted length
  while sorted_length < n - 1

    # set min to highest possible value
    min = Float::INFINITY

    # initialize reference to index of min value
    min_index = 0

    # from sorted length to end of array
    sorted_length.upto(n - 1) do |index|

      # get the lowest value
      # and it's index
      min, min_index = array[index], index if min > array[index]
    end

    # swap the min value for the value at
    # the beginning of the unsorted length
    array[sorted_length], array[min_index] = array[min_index], array[sorted_length]

    # now the unsorted length begins
    # at the next index
    sorted_length += 1
  end

  # return the array
  array
end


# ----------------------------------------
# Insert Sort
# ----------------------------------------

def insert_sort(array)

  # initialize the forward counter
  i = 0

  # store array
  n = array.length

  # while we have indexes
  while i < n

    # get current value
    a = array[i]

    # begin backwards counter at
    # current forward counter
    j = i

    # while the backwards counter
    # is not at the beginning
    # and value is less
    # than the previous value
    while j > 0 && array[j - 1] > a

      # swap the current value
      # with the previous
      array[j] = array[j - 1]

      # decrement backwards counter
      j -= 1
    end

    # increment forward counter
    i += 1
  end

  # return array
  array
end


# ----------------------------------------
# Merge Sort
# ----------------------------------------

def merge_sort(array)

  # store length of array
  n = array.length

  # base case
  return array if n <= 1

  # get left upper bound
  # and right lower bound indexes
  r = l = n / 2

  # adjust based on length
  # so we don't repeat values
  n.even? ? l -= 1 : r += 1

  # get array halves
  left = merge_sort(array[0..l])
  right = merge_sort(array[r..n])

  # initialize new array
  # to merge onto
  merged = []

  # until both left and right
  # have not values
  left_index = 0
  right_index = 0
  until left_index >= left.length ||
        right_index >= right.length

    # get first value from both sides
    l, r = left[left_index], right[right_index]

    # get the lesser value
    if r < l
      value = r
      right_index += 1
    else
      value = l
      left_index += 1
    end

    # merge it
    merged << value
  end

  if left_index < left.length
    (left_index...left.length).each do |index|
      merged << left[index]
    end
  else
    (right_index...right.length).each do |index|
      merged << right[index]
    end
  end

  # return merged array
  merged
end


# ----------------------------------------
# Quick Sort
# ----------------------------------------

def quick_sort(array)

  # partitioning
  partition = ->(array, lo, hi) do

    # pivot is the last index
    pivot = array[hi]

    # start i at min index
    i = lo

    # min index to n - 1
    lo.upto(hi - 1) do |j|

      # if the value is less or same
      # as pivot
      if array[j] <= pivot

        # swap those values
        array[i], array[j] = array[j], array[i]

        # look at next index
        i += 1
      end
    end

    # swap the pivot with the last index
    # we looked at
    array[i], array[hi] = array[hi], array[i]

    # return the new partition index
    i
  end

  # internal recursive quicksort
  qs = ->(array, lo, hi) do

    # if there is still distance
    # between min and max values
    if lo < hi

      # partition and capture return index
      p = partition.call(array, lo, hi)

      # quick sort left and right
      # sides of partition
      qs.call(array, lo, p - 1)
      qs.call(array, p + 1, hi)
    end
  end

  # set min and max and call internal
  # recursive quicksort
  lo = 0
  hi = array.length - 1
  qs.call(array, lo, hi)

  # return array
  array
end


# ----------------------------------------
# Count Sort
# ----------------------------------------

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


# ----------------------------------------
# Radix Sort
# ----------------------------------------

def radix_sort(array)
  queues = Array.new(10) {[]}

  char_index = 0
  has_negatives = no_chars = false

  until (no_chars)
    chars = []

    i = 0
    while (i < array.length)
      value = array[i].to_s
      char = value.reverse[char_index]
      has_negatives = true if char == '-'
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

  if has_negatives
    i = 0
    while (i < array.length)
      if array[i] < 0
        value = array.slice!(i)
        array.unshift(value)
      end
      i += 1
    end
  end

  array
end


