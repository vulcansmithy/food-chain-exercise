require File.dirname(__FILE__) + "/food_chain.rb"

class FoodChain
  
  # this enable this ruby script to be run from the command output. Example - $> ruby food_chain.rb
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

      build_first_output_per_verse( picked_creature)
      build_second_output_per_verse(picked_creature)    

      # if the picked creature is a 'horse' just skip the code below and display the last output in the verse
      unless picked_creature == "horse"
        
        last_swallowed_creature = (i == 1 ? "fly" : nil)

        (i - 1).downto(1) do |n|
          currently_swallowed_creature  = @menagerie[n]
          previously_swallowed_creature = @menagerie[n - 1]
          last_swallowed_creature       = build_who_swallowed_who(currently_swallowed_creature, previously_swallowed_creature)        
        end
        
        build_last_output_per_verse(last_swallowed_creature)
      end  
    end
    
    display_song_lyrics
    
    return @song_lyrics
  end  
  
  def build_first_output_per_verse(picked_creature)
    if picked_creature.nil? or picked_creature.empty?
      raise "Passed 'picked_creature' was either nil or empty string. Said parameter should not be nil or empty." 
    end
    
    @song_lyrics += "I know an old lady who swallowed a #{picked_creature}.\n" 
  end
  
  def build_second_output_per_verse(picked_creature)
    if picked_creature.nil? or picked_creature.empty?
      raise "Passed 'picked_creature' was either nil or empty string. Said parameter should not be nil or empty." 
    end
 
    output = case picked_creature
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
      raise "Unrecognized submitted creature. '#{picked_creature}'." 
    end  
 
    @song_lyrics += output
  end
  
  def build_last_output_per_verse(last_swallowed_creature)
    if last_swallowed_creature.nil? or last_swallowed_creature.empty?
      raise "Passed 'last_swallowed_creature' was either nil or empty string. Said parameter should not be nil or empty." 
    end
    
    @song_lyrics += "I don't know why she swallowed the #{last_swallowed_creature}. Perhaps she'll die.\n\n"
  end
  
  def build_who_swallowed_who(currently_swallowed_creature, previously_swallowed_creature)
    if currently_swallowed_creature.nil? or currently_swallowed_creature.empty?
      raise "Passed 'currently_swallowed_creature' was either nil or empty string. Said parameter should not be nil or empty." 
    end
    
    if previously_swallowed_creature.nil? or previously_swallowed_creature.empty?
      raise "Passed 'previously_swallowed_creature' was either nil or empty string. Said parameter should not be nil or empty." 
    end
      
    
    output = case previously_swallowed_creature
    when "goat", "dog", "cat", "bird", "fly"
      "She swallowed the #{currently_swallowed_creature} to catch the #{previously_swallowed_creature}.\n"
    when "spider"
      "She swallowed the #{currently_swallowed_creature} to catch the #{previously_swallowed_creature} that wriggled and jiggled and tickled inside her.\n"
    else
      raise "Unrecognized submitted creature. '#{previously_swallowed_creature}'."   
    end
    
    @song_lyrics += output
    
    return previously_swallowed_creature
  end
  
  def display_song_lyrics
    puts "#{@song_lyrics}"
  end  
  
end