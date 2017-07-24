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

      puts "@DEBUG #{__LINE__}    I know an old lady who swallowed a #{animal}.     #{i}"      

      case animal
      when "fly"
        # Do nothing. This is here to make sure 'fly' is processed and not mistakenly be unrecognized...
      when "bird" 
        puts "@DEBUG #{__LINE__}    How absurd to swallow a #{animal}!" 
      when "cat" 
        puts "@DEBUG #{__LINE__}    Imagine that, to swallow a #{animal}!"
      when "dog"
        puts "@DEBUG #{__LINE__}    What a hog, to swallow a #{animal}!"
      when  "goat" 
        puts "@DEBUG #{__LINE__}    Just opened her throat and swallowed a #{animal}!"
      when  "cow" 
        puts "@DEBUG #{__LINE__}    I don't know how she swallowed a #{animal}!"
      when "horse" 
        puts "@DEBUG #{__LINE__}    She's dead, of course!"
        break 
      else
        puts "@DEBUG #{__LINE__}    ERROR! Unrecognized animal, #{animal}." 
      end    
      

      previously_swallowed = nil
      currently_swallowed  = nil
      (i - 1).downto(1) do |n|
        previously_swallowed = menagerie[n - 1]
         currently_swallowed = menagerie[n    ]
    
        case previously_swallowed
        when "goat", "dog", "cat", "bird", "fly"
          puts "@DEBUG #{__LINE__}    She swallowed the #{currently_swallowed} to catch the #{previously_swallowed}."
        when "spider"
          puts "@DEBUG #{__LINE__}    She swallowed the #{currently_swallowed} to catch the #{previously_swallowed} that wriggled and jiggled and tickled inside her."
        else
          puts "@DEBUG #{__LINE__}    ERROR! Unrecognized animal, #{previously_swallowed}."    
        end
      end
      last_swallowed = previously_swallowed
      
      
      puts "@DEBUG #{__LINE__}    I don't know why she swallowed the #{last_swallowed}. Perhaps she'll die."
      puts "@DEBUG #{__LINE__}    "
      puts "@DEBUG #{__LINE__}    "
    end
  end  
  
end