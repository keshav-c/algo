# frozen_string_literal: true

require_relative 'node'

class Graph
  attr_reader :vertices

  def initialize(graph_data)
    @vertices = []
    graph_data.each_key { |key| @vertices[key] = Node.new(key) }
    graph_data.each do |key, neighbours|
      neighbours.each do |neighbour| 
        join(vertices[key], vertices[neighbour])
      end
    end
    vertices.each.with_index do |node, i| 
      vertices[i] = Node.new(i) if node.nil?
    end
  end

  def join(node1, node2)
    unless vertices[node1.data].nil? || vertices[node2.data].nil?
      node1.make_neighbour(node2)
      node2.make_neighbour(node1)
    end
  end

  def get_path(start, dest)
    def trace path, dest
      current = path[-1]
      if current.neighbours.include? dest
        return path + [dest]
      else
        current.neighbours.each do |next_node|
          unless path.include? next_node
            full_path = trace(path + [next_node], dest)
            return full_path if full_path
          end
        end
        nil
      end
    end
    start, dest = vertices[start], vertices[dest]
    path = trace([start], dest)
  end

  def breadth_first_search(start)
    queue = [vertices[start]]
    visited = Array.new(vertices.size, false)
    until queue.empty? do
      removed = queue.shift
      unless visited[removed.data]
        removed.neighbours.each { |node| queue << node }
        yield(removed) if block_given?
        visited[removed.data] = true
      end
    end
  end

  def depth_first_search(node, visited, &proc)
    unless visited[node.data]
      yield(node) if block_given?
      visited[node.data] = true
      node.neighbours.each do |next_node| 
        depth_first_search(next_node, visited, &proc) 
      end
    end
  end

  def connected_components
    visited = Array.new(vertices.size, false)
    components = []
    (0...visited.length).each do |i|
      unless visited[i]
        component = []
        depth_first_search(vertices[i], visited) do |node|
          visited[node.data] = true
          component << node.data
        end
        components << component
      end
    end
    components
  end
end
