# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  i =0
  total = 0
  while i<arr.length()
    total = total + arr[i]
    i = i + 1
  end
  
  return total

end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.length()==0
    return 0
  elsif arr.length()==1
    return arr[0]
  else
    i = 2
    if arr[0]>arr[1]
      first = arr[0]
      second = arr[1]
    else
      first = arr[1]
      second = arr[0]
    end
    while i<arr.length()
      if arr[i]>=second
        if arr[i]>=first
          second = first
          first = arr[i]
          
        else
          second = arr[i]
        end
      end
      i = i + 1
    end
    return (first + second)
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.leng()==0 || arr.length()==1
    return false
  else
    
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
end

def starts_with_consonant? s
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
end

# Part 3

class BookInStock
# YOUR CODE HERE
end
