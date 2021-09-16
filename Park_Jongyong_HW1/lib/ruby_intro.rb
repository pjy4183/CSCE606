# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  # i =0
  total = 0
  # while i<arr.length()
  #   total = total + arr[i]
  #   i = i + 1
  # end
  
  arr.each do |num|
    total += num
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
  if arr.length()==0 || arr.length()==1
    return false
  else
    i = arr.length() - 1
    while i>=0
      remain = n - arr[i]
      for j in 0..i-1 do
        if remain == arr[j]
          return true
        end
      end
      i = i-1
    end
    return false
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  result = "Hello, " << name
  return result
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s =~ /^[^aeiou\W]/i
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s.length()==0
    return false;
  elsif  s =~ /^[0,1]*$/i
    if s.to_i(2)%4 == 0
      return true;
    else
      return false;
    end
  else
    return false;
    
  end

end

# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(isbn, price)
    raise ArgumentError.new(
      "Argument Error\n"
    ) if isbn.length()==0 || price<=0
    @isbn = isbn
    @price = price
  end

  def isbn
    @isbn
  end

  def isbn=(isbn)
    @isbn=isbn
  end

  def price
    @price
  end

  def price=(price)
    @price=price
  end


  def price_as_string
    result = "$%0.2f" % [@price]
    return result
  end
end
