def get_min_magic(src, dest, wizards)
  minCost = 0
  minPath = []

  minCosts = Array.new(10, Float::INFINITY)
  prev = Array.new(10)
  visited = Array.new(10, false)
  
  minCosts[src] = 0
  currentWiz = src
  loop do
    # Shortest path algorithm
    wizards[currentWiz].digits(10).each do |reference|
      if !visited[reference]
        cost_from_current = minCosts[currentWiz] + (currentWiz - reference) ** 2
        if cost_from_current < minCosts[reference]
          minCosts[reference] = cost_from_current
          prev[reference] = currentWiz
        end
      end
    end
    visited[currentWiz] = true
    # Choose next wizard
    smallestCost = Float::INFINITY
    currentWiz = nil
    minCosts.each_with_index do |referenceCost, wizard|
      if !visited[wizard] && referenceCost < smallestCost
        smallestCost = referenceCost
        currentWiz = wizard
      end
    end
    break if currentWiz == dest
  end
  # Results
  minCost = minCosts[currentWiz]
  until currentWiz == nil
    minPath.unshift(currentWiz)
    currentWiz = prev[currentWiz]
  end

  return minCost, minPath
end