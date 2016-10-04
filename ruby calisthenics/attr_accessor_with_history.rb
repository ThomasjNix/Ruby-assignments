class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def initialize
        @#{attr_name}_history = [nil]
        @new_history = [nil]
      end
      
      def #{attr_name}
        @#{attr_name}
      end

      def #{attr_name}=(value)
        @new_history.each_with_index do |elm, index|
          @#{attr_name}_history[index]=elm
        end
        @new_history.push(value)
      end
      
      def #{attr_name}_history
        @#{attr_name}_history
      end
    }
  end
end

class Test
  attr_accessor_with_history :bar
end

f = Test.new
print 'Initialization: '+ f.bar_history.to_s + "\n"
f.bar = 1
print 'Set bar equal to 1: '+ f.bar_history.to_s + "\n"
f.bar = 2
print 'Set bar equal to 2: '+ f.bar_history.to_s + '\n'
f.bar = 'test_value'
print 'Set bar equal to string test_value: '+ f.bar_history.to_s + '\n'