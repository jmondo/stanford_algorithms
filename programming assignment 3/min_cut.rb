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
    # until vertex_array.count == 2
      merge_vertices(*random_vertices)
    # end
  end

  private

  def random_vertices
    subarray = vertex_array.sample
    vertex_1 = subarray[0]
    vertex_2 = subarray[1].sample
    [vertex_1, vertex_2]
  end

  def merge_vertices(vertex_1, vertex_2)
    replace_index_vertex(vertex_1, vertex_2)
    # merge_vertex_groups(vertex_1, vertex_2)
    # replace_vertex_in_subarray(vertex_1, vertex_2, subarray)
    # remove_self_loops(vertex_1, new_subarray)
  end

  def replace_index_vertex(vertex_1, vertex_2)
  end

  def merge_vertex_groups(vertex_1, vertex_2)

  end

  def replace_vertex_in_subarray(vertex_1, vertex_2, subarray)

  end

  def remove_self_loops(vertex_1, new_subarray)

  end
end

p RandomMinCut.new(vertex_array).min_cut

