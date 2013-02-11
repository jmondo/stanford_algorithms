# merge sort
# 1. recursively order the left half (n/2 things)
# 2. recursively order the right half (n/2 things)
# 3. merge them back together
# base case - if you have 0 or 1 elements in the array, return it
c = [2,4,6,3,8,1,3,5]

def merge_sort(c)
  # halve it
  split = c.length / 2 #half round down
  a = c[0..(split-1)] #left
  b = c[split..-1] #right

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
    end
  end

  return c
end

p merge_sort(c)


# start with full size array, build 2 sub arrays each with half of original values
# pass both to the merge thing
# merge thing returns merged stuff
