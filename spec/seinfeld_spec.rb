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

  describe '#count_words' do
    it 'returns hash where key is a word and value is number of occurrences' do
      dialogue = ['one']
      expect(top_words.count_words(dialogue)).to eq({'one' => 1})
    end
  end

  describe '#sorted_count' do
    it 'returns array key value pairs sorted by hash value' do
      hash = {'a' => 2, 'b' => 5, 'c' => 1}
      expect(top_words.sorted_count(hash)).to eq [['b', 5], ['a', 2], ['c', 1]]
    end
  end
end
