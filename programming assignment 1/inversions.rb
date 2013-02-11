# merge sort
# 1. recursively order the left half (n/2 things)
# 2. recursively order the right half (n/2 things)
# 3. merge them back together
# base case - if you have 0 or 1 elements in the array, return it
c = File.readlines('./IntegerArray.txt').collect(&:to_i)

# a = [1,3,5,2,4,6]
# b = [1,2,3,4,5,6]
# c = [6,5,4,3,2,1]
# d = [6,5,4,3,2,1,7]
# e = [6,5,4,3,2,1,7,8]


def merge_sort(c)
  # halve it
  split = c.length / 2 #half round down
  a = c[0..(split-1)] #left
  b = c[split..-1] #right
  @inversions ||= 0

  a = merge_sort(a) unless a.length < 2
  b = merge_sort(b) unless b.length < 2
  merge_in_order(a, b)
end

def merge_in_order(a,b)
  # a and b are ordered arrays
  i = 0
  j = 0
  c = []

  while a[i] || b[j]
    if !b[j]
      c << a[i]
      i += 1
      next
    end

    if !a[i]
      c << b[j]
      j += 1
      next
    end

    if a[i] < b[j]
      c << a[i]
      i += 1
    else
      c << b[j]
      j += 1
      @inversions += (a.length - i)
    end
  end
  return c
end

@inversions = 0
merge_sort(c)
puts @inversions

# start with full size array, build 2 sub arrays each with half of original values
# pass both to the merge thing
# merge thing returns merged stuff
