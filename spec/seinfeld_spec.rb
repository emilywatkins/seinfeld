require 'spec_helper'

RSpec.describe TopWords do
  top_words = TopWords.new

  describe '#character_dialogue_arr' do
    it 'takes string and returns array of words' do
      dialogue = ['one two']
      expect(top_words.character_dialogue_arr(dialogue)).to eq ['one', 'two']
    end
  end

  describe '#remove_non_letters' do
    it 'removes non-letters from array' do
      dialogue = ['test,']
      expect(top_words.remove_non_letters(dialogue)).to eq ['test']
    end
  end
end
