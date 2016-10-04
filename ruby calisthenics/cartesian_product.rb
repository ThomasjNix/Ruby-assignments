class CartesianProduct
  include Enumerable

  def initialize(seq1, seq2)
      @firstSequence = seq1
      @secondSequence = seq2
      return each {|i|}
  end
  
  def each 
    @firstSequence.each do |s1elm|
      @secondSequence.each do |s2elm|
        yield [s1elm,s2elm]
      end
    end
  end 
  
end

