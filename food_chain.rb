require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command line. Example - $> ruby food_chain.rb
  if __FILE__ == $PROGRAM_NAME
    FoodChain.new.main 
  end
  
  def initialize
    @menagerie = [
      "fly",
      "spider",
      "bird",
      "cat",
      "dog",
      "goat",
      "cow",
      "horse",
    ]
  end  
  
  def main
    
    for i in 1..@menagerie.count
      picked_animal = @menagerie[i - 1]

      puts "\nI know an old lady who swallowed a #{picked_animal}.     #{i}"      

      case picked_animal
      when "fly"
        # Do nothing. This is here to make sure 'fly' is processed and not mistakenly be unrecognized...
      when "spider"
        puts "It wriggled and jiggled and tickled inside her."  
      when "bird" 
        puts "How absurd to swallow a #{picked_animal}!" 
      when "cat" 
        puts "Imagine that, to swallow a #{picked_animal}!"
      when "dog"
        puts "What a hog, to swallow a #{picked_animal}!"
      when  "goat" 
        puts "Just opened her throat and swallowed a #{picked_animal}!"
      when  "cow" 
        puts "I don't know how she swallowed a #{picked_animal}!"
      when "horse" 
        puts "She's dead, of course!"
        break 
      else
        puts "ERROR! Unrecognized animal, #{picked_animal}." 
      end    
      

      last_swallowed = nil
      (i - 1).downto(1) do |n|
        previously_swallowed = @menagerie[n - 1]
         currently_swallowed = @menagerie[n    ]
    
        last_swallowed = who_swallowed_who(currently_swallowed, previously_swallowed)        
      end

      puts "I don't know why she swallowed the #{last_swallowed}. Perhaps she'll die.\n\n\n"
    end
  end  
  
  def who_swallowed_who(currently_swallowed, previously_swallowed)
    
    case previously_swallowed
    when "goat", "dog", "cat", "bird", "fly"
      puts "She swallowed the #{currently_swallowed} to catch the #{previously_swallowed}."
    when "spider"
      puts "She swallowed the #{currently_swallowed} to catch the #{previously_swallowed} that wriggled and jiggled and tickled inside her."
    else
      puts "ERROR! Unrecognized animal, #{previously_swallowed}."    
    end
    
    return previously_swallowed
  end
  
end