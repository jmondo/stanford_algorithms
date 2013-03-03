require 'pry'
vertex_array = []

File.open('kargerMinCut.txt').each_line do |line|
  line = line.split("\t")
  key = line[0].to_i
  values = line[1..-1]
  vertex_array << [key, values.collect(&:to_i)]
end

class RandomMinCut
  attr_reader :vertex_array

  def initialize(array)
    @vertex_array = array
  end

  def min_cut
    until vertex_array.count == 2
      merge_vertices(*random_vertices)
    end
    p vertex_array[0][1].count
  end

  private

  def random_vertices
    subarray = vertex_array.sample
    vertex_1 = subarray[0]
    vertex_2 = subarray[1].sample
    [vertex_1, vertex_2]
  end

  def merge_vertices(vertex_1, vertex_2)
    merge_and_replace_index_vertex(vertex_1, vertex_2)
    replace_vertex_in_subarrays(vertex_1, vertex_2)
  end

  def merge_and_replace_index_vertex(vertex_1, vertex_2)
    group_1 = vertex_array.assoc(vertex_1)
    vertex_array.assoc(vertex_2)[1] += group_1[1] rescue p "trying to access #{vertex_2}"
    vertex_array.delete(group_1)
  end

  def replace_vertex_in_subarrays(vertex_1, vertex_2)
    vertex_array.each { |group| replace_vertex_in_subarray(vertex_1, vertex_2, group) }
  end

  def replace_vertex_in_subarray(old_value, new_value, group)
    subarray = group[1]
    subarray.collect! do |vertex|
      if vertex == old_value
        new_value
      else
        vertex
      end
    end
    subarray.reject! {|vertex| vertex == group[0]}
  end

end

RandomMinCut.new(vertex_array).min_cut

