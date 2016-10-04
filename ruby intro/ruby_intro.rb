# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0
  if arr.empty?
    return 0
  else
    arr.each do |elm|
      sum += elm
    end
    return sum
  end
end

def max_2_sum arr
  sum = 0
  if arr.empty?
    return 0
  elsif arr.count==1
    return arr[0]
  else
    arr.sort! 
    arr.reverse!
    sum = arr[0]+arr[1]
    return sum
  end
end

def sum_to_n? arr, n
  if arr.empty? 
    return false 
  elsif arr.count==1
    return false
  else
    return_bool=false
    arr.each_with_index do |elm, index|
      if (elm<n)
        difference = n-elm
        value_holder=elm
        arr[index]=nil
        if arr.include? difference
          return_bool=true
        end
        arr[index]=value_holder
      end
    end
  end
  return return_bool
end
# Part 2

def hello(name)
  return "Hello, "+name
end

def starts_with_consonant? s
  if s != ''
    if s[0].match(/[^aeiouAEIOU\d\s_+-.,!@#$%^&*():=?;\/|<>"']/)
      return true
    else
      return false
    end
  end
end

def binary_multiple_of_4? s
  is_valid_binary = (Integer(s) != nil) rescue false
  character_array = []
  place_multiplier = 1
  total_sum = 0
  if is_valid_binary
    character_array=s.split('')
    character_array.reverse!
    character_array.each do |place|
      total_sum+= place.to_i*place_multiplier
      place_multiplier*=2
    end
  end
  
  if (total_sum%4==0 && is_valid_binary)
    is_valid_binary = true
  else
    is_valid_binary = false
  end

  return is_valid_binary
end

# Part 3

class BookInStock
  def initialize(isbn_num, book_price)
    if !isbn_num.empty?
        @isbn = isbn_num
    else
      raise ArgumentError.new("Empty ISBNs are not valid.")
    end
    
    if (book_price>0)
      @price = book_price
    else
      raise ArgumentError.new("Price must be greater than zero")
    end
  end
  
  def price 
    return @price
  end
  
  def isbn
    return @isbn
  end
  
  def price=(value)
    @price = value
  end
  
  def isbn=(value)
    @isbn = value
  end
  
  def price_as_string 
    return "$"+"#{'%.2f' % @price}"
  end
end
