require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command line. Example - $> ruby food_chain.rb
  if __FILE__ == $PROGRAM_NAME
    FoodChain.new.main 
  end
  
  def initialize
    puts "@DEBUG #{__LINE__}    Running inside initialize..."
  end  
  
  def main
    puts "@DEBUG #{__LINE__}    Running inside main..."
  end  
  
end