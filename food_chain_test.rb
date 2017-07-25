require "minitest/autorun"

require_relative "food_chain"

class FoodChainTest  < Minitest::Test
  
  def test_build_song_lyrics
    song_file = File.expand_path('../food_chain_song.txt', __FILE__)
    expected  = IO.read(song_file)
    assert_equal expected, FoodChain.new.main
  end  
  
end