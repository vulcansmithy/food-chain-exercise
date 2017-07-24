require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command line. Example - $> ruby food_chain.rb
  if __FILE__ == $PROGRAM_NAME
    FoodChain.new.main 
  end
  
  def initialize
  end  
  
  def main
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

    for i in 1..animal_menagerie.count
      animal = animal_menagerie[i - 1]
      if    animal == "bird"
        puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{animal}.     #{i}"
        puts "@DEBUG #{__LINE__}    How absurd to swallow a bird!" 
        
      elsif animal == "spider"
        puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{animal}.     #{i}"
        puts "@DEBUG #{__LINE__}    It wriggled and jiggled and tickled inside her." 
        
      elsif animal == "fly"  
        puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{animal}.     #{i}"
      else  
        puts "@DEBUG #{__LINE__}    #{animal}                                         #{i}"
      end  

      (i - 1).downto(1) do |n|
        animal = animal_menagerie[n - 1]
        
        if    animal == "bird"
          puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{animal}."
        
        elsif animal == "spider"
 #         puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{animal}."
#          puts "@DEBUG #{__LINE__}    It wriggled and jiggled and tickled inside her." 
          puts "@DEBUG #{__LINE__}    She swallowed the #{animal_menagerie[n]} to catch the #{animal_menagerie[n - 1]} that wriggled and jiggled and tickled inside her."
        
        elsif animal == "fly"  
          puts "@DEBUG #{__LINE__}    She swallowed the #{animal_menagerie[n]} to catch the #{animal_menagerie[n - 1]}."
        else  
          puts "@DEBUG #{__LINE__}    #{animal}"
        end 
      end
      
      
      puts "@DEBUG #{__LINE__}    I don't know why she swallowed the #{animal}. Perhaps she'll die."
      puts "@DEBUG #{__LINE__}    "
      puts "@DEBUG #{__LINE__}    "
      puts "@DEBUG #{__LINE__}    "
    end
  end  
  
end