require 'spec_helper'

describe('TopWords') do
  describe('#get_top_words') do
    it 'returns most commonly used words' do
      words = ['apple', 'ball', 'cat', 'ball']
      top_words = TopWords.new(words)
      expect(top_words.get_top_words).to eq ['ball', 'apple', 'cat']
    end
  end
end
