require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command line. Example - $> ruby food_chain.rb
  if __FILE__ == $PROGRAM_NAME
    FoodChain.new.main 
  end
  
  def initialize
  end  
  
  def main
    puts "@DEBUG #{__LINE__}    Running inside main..."
    
    animal_menagerie = [
      "fly",
      "spider",
      "bird",
      "cat",
      "dog",
      "goat",
      "cow",
      "horse",
    ]

    for i in 0..(animal_menagerie.size - 1) 
      puts "@DEBUG #{__LINE__}    #{animal_menagerie[i]}"
      (i - 1).downto(0) do |n|
        puts "@DEBUG #{__LINE__}    #{animal_menagerie[n]}"
      end
      
      
      puts "@DEBUG #{__LINE__}    "
    end
  end  
  
end