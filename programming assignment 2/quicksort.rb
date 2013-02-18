# sort the array and count the number of comparisons required
class QuickSort
  attr_accessor :count, :swap_method, :array

  def initialize(options = {})
    @count = 0
    @swap_method = options[:swap_method]
    @array = options[:array]
  end

  def sort!
    @answer ||= quick(array,0,array.size-1)
  end

  def count
    sort!
    @count
  end

  private

  def quick(array, left, right)
    if left < right
      p = partition(array, left, right)
      quick(array, left, p - 1)
      quick(array, p + 1, right)
    end
    array
  end

  def partition(array, left, right)
    length = right - left # there are actually + 1 elements, but we don't want to count the first anyway
    @count += length
    swap_pivot(array, left, right)
    p = array[left] # the partition value
    i = left + 1 # index of the split between < and > (the last <)
    for j in (left+1)..right do # j is the index of the first one we haven't processed
      if array[j] < p
        array[j], array[i] = array[i], array[j]
        i += 1
      end
    end
    pivot_index = i - 1
    array[left], array[pivot_index] = array[pivot_index], array[left]
    pivot_index
  end

  def swap_pivot(array, left, right)
    if swap_method == :right
      array[left], array[right] = array[right], array[left] #swap left and right
    elsif swap_method == :median
      median_offset = (right - left)/2
      median_index = left + median_offset
      swap_index = median_index(array, left, median_index, right)
      array[left], array[swap_index] = array[swap_index], array[left]
    end
  end

  def median_index(array, left, middle, right)
    indexes = [left, middle,right]
    choices = indexes.collect {|i| [i, array[i]]}
    choices.sort_by!{|a| a[1]} #yeah ok kind of a cheat, but not the point of the assignment
    choices[1][0]
  end

end

array = File.readlines('./QuickSort.txt').collect(&:to_i)

p QuickSort.new(swap_method: :left, array: array.dup).count
p QuickSort.new(swap_method: :right, array: array.dup).count
p QuickSort.new(swap_method: :median, array: array.dup).count

