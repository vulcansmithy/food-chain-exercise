require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command line. Example - $> ruby food_chain.rb
  if __FILE__ == $PROGRAM_NAME
    FoodChain.new.main 
  end
  
  def initialize
  end  
  
  def main
    menagerie = [
      "fly",
      "spider",
      "bird",
      "cat",
      "dog",
      "goat",
      "cow",
      "horse",
    ]

    for i in 1..menagerie.count
      animal = menagerie[i - 1]

      puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{menagerie[i - 1]}.     #{i}"      

      if    animal == "horse"
        puts "@DEBUG #{__LINE__}    he's dead, of course!"
        break
      
      elsif animal == "cow"
        puts "@DEBUG #{__LINE__}    I don't know how she swallowed a #{menagerie[i - 1]}!"
        
      elsif animal == "goat"
        puts "@DEBUG #{__LINE__}    Just opened her throat and swallowed a #{menagerie[i - 1]}!"
      
      elsif animal == "dog"
        puts "@DEBUG #{__LINE__}    What a hog, to swallow a #{menagerie[i - 1]}!"
        
      elsif animal == "cat"
        puts "@DEBUG #{__LINE__}    Imagine that, to swallow a #{menagerie[i - 1]}!"
        
      elsif animal == "bird"
        puts "@DEBUG #{__LINE__}    How absurd to swallow a bird!" 
        
      elsif animal == "spider"
        puts "@DEBUG #{__LINE__}    It wriggled and jiggled and tickled inside her." 
      end  

      previously_swallowed = nil
      previously_swallowed = nil
      (i - 1).downto(1) do |n|
        previously_swallowed = menagerie[n - 1]
         currently_swallowed = menagerie[n    ]
    
        case previously_swallowed
        when "goat", "dog", "cat", "bird", "fly"
          puts "@DEBUG #{__LINE__}    She swallowed the #{currently_swallowed} to catch the #{previously_swallowed}."
        when "spider"
          puts "@DEBUG #{__LINE__}    She swallowed the #{currently_swallowed} to catch the #{previously_swallowed} that wriggled and jiggled and tickled inside her."
        else
          puts "@DEBUG #{__LINE__}    Error! Unrecognized animal, #{previously_swallowed}."    
        end
      end
      last_swallowed = previously_swallowed
      
      
      puts "@DEBUG #{__LINE__}    I don't know why she swallowed the #{last_swallowed}. Perhaps she'll die."
      puts "@DEBUG #{__LINE__}    "
      puts "@DEBUG #{__LINE__}    "
      puts "@DEBUG #{__LINE__}    "
    end
  end  
  
end