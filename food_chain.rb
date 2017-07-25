require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command line. Example - $> ruby food_chain.rb
  if __FILE__ == $PROGRAM_NAME
    FoodChain.new.main 
  end
  
  def initialize
    @song_lyrics = ""
    @menagerie   = [
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

      build_first_line_per_verse( picked_creature)
      build_second_line_per_verse(picked_creature)    

      unless picked_creature == "horse"
        
        last_swallowed_creature = (i == 1 ? "fly" : nil)

        (i - 1).downto(1) do |n|
          currently_swallowed_creature  = @menagerie[n]
          previously_swallowed_creature = @menagerie[n - 1]
          last_swallowed_creature       = build_who_swallowed_who(currently_swallowed_creature, previously_swallowed_creature)        
        end
        
        build_last_line_per_verse(last_swallowed_creature)
      end  
    end
    
    display_song_lyrics
    
    return @song_lyrics
  end  
  
  def build_first_line_per_verse(picked_creature)
    line = "I know an old lady who swallowed a #{picked_creature}.\n"  
    
    @song_lyrics += line
  end
  
  def build_second_line_per_verse(picked_creature)
 
    line = case picked_creature
    when "fly"
      "" # Intentionally left blank. This is here to make sure 'fly' is processed and not mistakenly to be "unrecognized"...
    when "spider"
      "It wriggled and jiggled and tickled inside her.\n"  
    when "bird" 
      "How absurd to swallow a bird!\n" 
    when "cat" 
      "Imagine that, to swallow a cat!\n"
    when "dog"
      "What a hog, to swallow a dog!\n"
    when  "goat" 
      "Just opened her throat and swallowed a goat!\n"
    when  "cow" 
      "I don't know how she swallowed a cow!\n"
    when "horse" 
      "She's dead, of course!"
    else
      puts "ERROR! Unrecognized submitted creature, #{picked_creature}." 
      return
    end  
 
    @song_lyrics += line
  end
  
  def build_last_line_per_verse(last_swallowed_creature)
    @song_lyrics += "I don't know why she swallowed the #{last_swallowed_creature}. Perhaps she'll die.\n\n"
  end
  
  def build_who_swallowed_who(currently_swallowed_creature, previously_swallowed_creature)
    
    line = case previously_swallowed_creature
    when "goat", "dog", "cat", "bird", "fly"
      "She swallowed the #{currently_swallowed_creature} to catch the #{previously_swallowed_creature}.\n"
    when "spider"
      "She swallowed the #{currently_swallowed_creature} to catch the #{previously_swallowed_creature} that wriggled and jiggled and tickled inside her.\n"
    else
      "ERROR! Unrecognized submitted creature, #{previously_swallowed_creature}."    
    end
    
    @song_lyrics += line
    
    return previously_swallowed_creature
  end
  
  def display_song_lyrics
    puts "\n\n#{@song_lyrics}"
  end  
  
end