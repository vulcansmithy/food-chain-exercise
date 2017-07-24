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

      puts "I know an old lady who swallowed a #{animal}.     #{i}"      

      case animal
      when "fly"
        # Do nothing. This is here to make sure 'fly' is processed and not mistakenly be unrecognized...
      when "bird" 
        puts "How absurd to swallow a #{animal}!" 
      when "cat" 
        puts "Imagine that, to swallow a #{animal}!"
      when "dog"
        puts "What a hog, to swallow a #{animal}!"
      when  "goat" 
        puts "Just opened her throat and swallowed a #{animal}!"
      when  "cow" 
        puts "I don't know how she swallowed a #{animal}!"
      when "horse" 
        puts "She's dead, of course!"
        break 
      else
        puts "ERROR! Unrecognized animal, #{animal}." 
      end    
      

      previously_swallowed = nil
      currently_swallowed  = nil
      (i - 1).downto(1) do |n|
        previously_swallowed = menagerie[n - 1]
         currently_swallowed = menagerie[n    ]
    
        case previously_swallowed
        when "goat", "dog", "cat", "bird", "fly"
          puts "She swallowed the #{currently_swallowed} to catch the #{previously_swallowed}."
        when "spider"
          puts "She swallowed the #{currently_swallowed} to catch the #{previously_swallowed} that wriggled and jiggled and tickled inside her."
        else
          puts "ERROR! Unrecognized animal, #{previously_swallowed}."    
        end
      end
      last_swallowed = previously_swallowed
      
      
      puts "I don't know why she swallowed the #{last_swallowed}. Perhaps she'll die.\n\n\n"
    end
  end  
  
end