require 'spec_helper'

RSpec.describe TopWords do
  top_words = TopWords.new
  
  describe '#character_dialogue_arr' do
    it 'takes string and returns array of words' do
      dialogue = ['one two']
      expect(top_words.character_dialogue_arr(dialogue)).to eq ['one', 'two']
    end
  end
end
