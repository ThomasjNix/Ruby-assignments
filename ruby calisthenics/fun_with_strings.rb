module FunWithStrings
  def palindrome? 

    if self.gsub(/\W/,"").downcase == self.gsub(/\W/,"").downcase.reverse
      return true
    else
      return false
    end
  end
  
  def count_words
    word_array = self.downcase.gsub(/[^a-zA-z]/," ").split(' ')
    word_hash = Hash.new()
    word_array.each do |word|
      if word_hash.include? word 
        word_hash[word] += 1
      else
        word_hash[word]=1
      end
    end
    return word_hash
  end
  
  
  def anagram_groups
    return_array = Array.new()
    split_array = self.split(' ')
    split_array.each_with_index do |first_compare, index|
      holder_array = []
      holder_array.push(first_compare)
      split_array.each_with_index do |second_compare, index2|
        if (index2>index)
          if first_compare.chars.sort.join == second_compare.chars.sort.join
            holder_array.push(second_compare)
            split_array[index2]=''
          end
        end
      end
      if (holder_array[0]!='')
        return_array.push(holder_array)
      end
    end
    return return_array
  end

end
# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

print "scream cars for four scar creams".anagram_groups
