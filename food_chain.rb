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
    
    for i in 1..@menagerie.size
      picked_creature = @menagerie[i - 1]

      display_first_line_per_verse( picked_creature)
      display_second_line_per_verse(picked_creature)    

      unless picked_creature == "horse"
        
        last_swallowed_creature = nil
        (i - 1).downto(1) do |n|
          currently_swallowed_creature  = @menagerie[n]
          previously_swallowed_creature = @menagerie[n - 1]
          last_swallowed_creature       = display_who_swallowed_who(currently_swallowed_creature, previously_swallowed_creature)        
        end

        display_last_line_per_verse(last_swallowed_creature)
      end  
    end
  end  
  
  def display_first_line_per_verse(picked_creature)
    puts "\nI know an old lady who swallowed a #{picked_creature}."  
  end
  
  def display_second_line_per_verse(picked_creature)
    
    case picked_creature
    when "fly"
      # Do nothing. This is here to make sure 'fly' is processed and not mistakenly to be "unrecognized"...
    when "spider"
      puts "It wriggled and jiggled and tickled inside her."  
    when "bird" 
      puts "How absurd to swallow a bird!" 
    when "cat" 
      puts "Imagine that, to swallow a cat!"
    when "dog"
      puts "What a hog, to swallow a dog!"
    when  "goat" 
      puts "Just opened her throat and swallowed a goat!"
    when  "cow" 
      puts "I don't know how she swallowed a cow!"
    when "horse" 
      puts "She's dead, of course!\n\n"
    else
      puts "ERROR! Unrecognized submitted creature, #{picked_creature}." 
    end  
  end
  
  def display_last_line_per_verse(last_swallowed_creature)
    puts "I don't know why she swallowed the #{last_swallowed_creature}. Perhaps she'll die.\n\n"
  end
  
  def display_who_swallowed_who(currently_swallowed_creature, previously_swallowed_creature)
    
    case previously_swallowed_creature
    when "goat", "dog", "cat", "bird", "fly"
      puts "She swallowed the #{currently_swallowed_creature} to catch the #{previously_swallowed_creature}."
    when "spider"
      puts "She swallowed the #{currently_swallowed_creature} to catch the #{previously_swallowed_creature} that wriggled and jiggled and tickled inside her."
    else
      puts "ERROR! Unrecognized submitted creature, #{previously_swallowed_creature}."    
    end
    
    return previously_swallowed_creature
  end
  
end