# frozen_string_literal: true

require './lib/graph'

describe Graph do
  def dfs_wrapper(hash, start)
    graph = Graph.new(hash)
    start_vertex = graph.vertices[start]
    visited = Array.new(graph.vertices.size, false)
    res = []
    graph.depth_first_search(start_vertex, visited) { |node| res << node.data }
    res
  end

  def connected_wrapper(hash)
    graph = Graph.new(hash)
    graph.connected_components.length == 1
  end

  context '#get_path' do
    it 'finds a path' do
      hash = { 0 => [2], 1 => [4], 2 => [5, 0, 3], 3 => [2],
               4 => [1, 5], 5 => [4, 2] }
      path = Graph.new(hash).get_path(0, 4)
      path_found = path[0].data.zero? && path[-1].data == 4
      expect(path_found).to eql true
    end
    it 'returns nil when no path exists' do
      hash = {0 => [1, 3], 1 => [4, 0], 2 => [5], 3 => [0], 4 => [1], 5 => [2]}
      graph = Graph.new(hash)
      expect(graph.get_path(0, 5)).to eql nil
    end
    it 'finds a path' do
      hash = { 0 => [1], 1 => [2, 4], 2 => [3, 1], 3 => [4, 2],
               4 => [1, 5, 3, 5], 5 => [4, 6], 6 => [5, 7, 9], 7 => [6, 8],
               8 => [7, 9], 9 => [6, 8] }
      path = Graph.new(hash).get_path(0, 8)
      path_found = path[0].data.zero? && path[-1].data == 8
      expect(path_found).to eql true
    end
    it 'finds the only path' do
      hash = {0 => [3], 1 => [2, 3], 2 => [4, 1], 3 => [1, 0], 4 => [2]}
      graph = Graph.new(hash)
      expect(graph.get_path(0, 4).map { |n| n.data }).to eql [0, 3, 1, 2, 4]
    end
    it 'No path exists, passes test 5' do
      hash = { 0 => [1, 2, 3], 1 => [2, 0, 3], 2 => [0, 3, 1], 3 => [0, 1, 2],
               4 => [5], 5 => [4] }
      graph = Graph.new(hash)
      expect(graph.get_path(0, 4)).to eql nil
    end
  end
  context '#breadth_first_search' do
    it 'returns array in BFS form' do
      hash = { 0 => [2], 1 => [4], 2 => [5, 0, 3], 3 => [2], 4 => [1, 5],
               5 => [4, 2] }
      res = []
      Graph.new(hash).breadth_first_search(0) { |n| res << n.data }
      expect(res).to eql [0, 2, 5, 3, 4, 1]
    end
    it 'returns array in BFS form' do
      hash = { 0 => [1, 2, 3], 1 => [0, 4, 5], 2 => [0, 5, 6],
               3 => [0, 7, 8, 9], 4 => [1, 10, 11], 5 => [1, 2, 12],
               6 => [2, 13], 7 => [3], 8 => [3], 9 => [3], 10 => [4], 
               11 => [4], 12 => [5], 13 => [6] }
      res = []
      Graph.new(hash).breadth_first_search(0) { |n| res << n.data }
      expect(res).to eql [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    end
  end
  context 'Depth First Search order' do
    it 'returns array in DFS form' do
      hash = { 0 => [2], 1 => [4], 2 => [5, 0, 3], 3 => [2], 4 => [1, 5],
               5 => [4, 2] }
      expect(dfs_wrapper(hash, 0)).to eql [0, 2, 5, 4, 1, 3]
    end
    it 'returns array in DFS form' do
      hash = { 0 => [1, 2, 3], 1 => [0, 4, 5], 2 => [0, 5, 6],
               3 => [0, 7, 8, 9], 4 => [1, 10, 11], 5 => [1, 2, 12],
               6 => [2, 13], 7 => [3, 14], 8 => [3], 9 => [3], 10 => [4],
               11 => [4], 12 => [5], 13 => [6], 14 => [7] }
      expect(dfs_wrapper(hash, 0)).to eql [0, 1, 4, 10, 11, 5, 2, 6, 13, 12, 3, 7, 14, 8, 9]
    end
  end
  context "all nodes connected?" do
    it "finds more than 1 connected component in graph" do
      hash = { 0 => [1], 1 => [0, 3, 4], 2 => [5, 6], 3 => [1], 4 => [1], 
               5 => [2], 6 => [2] }
      expect(connected_wrapper(hash)).to eql false
    end
    it "finds only 1 connected component in graph" do
      hash = { 0 => [1, 2], 1 => [0, 3, 4], 2 => [0, 5, 6], 3 => [1], 4 => [1],          5 => [2], 6 => [2] }
      expect(connected_wrapper(hash)).to eql true
    end
    it "finds more than 1 connected component in graph" do
      hash = { 0 => [2], 1 => [4], 2 => [0], 3 => [5], 4 => [5, 1],
               5 => [4, 3] }
      expect(connected_wrapper(hash)).to eql false
    end
    it "finds more than 1 connected component in graph" do
      hash = { 0 => [1, 2], 1 => [0, 4], 2 => [0, 4], 3 => [5, 6], 
               4 => [1, 2, 7], 5 => [3], 6 => [3], 7 => [4] }
      expect(connected_wrapper(hash)).to eql false
    end
  end
  context "#has_cycle?" do
    it "Finds cycle in given graph" do
      hash = { 0 => [1, 2], 1 => [0, 2], 2 => [0, 1, 3, 4, 5], 3 => [2, 4], 
               4 => [3, 2], 5 => [2] }
      expect(Graph.new(hash).has_cycle?).to eql true
    end
    it "found no cycle in given graph" do
      hash = { 0 => [1, 2], 1 => [0, 3, 4], 2 => [0, 5, 6], 3 => [1], 4 => [1],          5 => [2], 6 => [2] } 
      expect(Graph.new(hash).has_cycle?).to eql false
    end
    it "found no cycle in given graph" do
      hash = { 0 => [2], 1 => [4, 3], 2 => [0, 5], 3 => [5, 1], 4 => [1], 
               5 => [2, 3] }
      expect(Graph.new(hash).has_cycle?).to eql false
    end
  end
end
