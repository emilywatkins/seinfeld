require 'pg'
require 'csv'
require 'set'

class TopWords
  def character_dialogue_arr(database_values)
    all_dialogue = []
    database_values.each do |value| # result is an array containing strings of dialogue
      words = value.to_s.split(' ')
      words.each do |word|
        all_dialogue.push(word)
      end
    end
    all_dialogue
  end

  def remove_non_letters(arr)
    arr.each do |word|
      word.gsub!(/[^0-9a-z ]/i, '')
    end
  end

  def count_words(arr)
    counts = Hash.new 0
    arr.each do |word|
      counts[word] += 1
    end
    counts
  end

  def sorted_count(hash)
    hash.sort_by { |k, v| v }.reverse
  end

  def top_five(arr)
    arr.map { |k, v| k }[0..4]
  end

  def print_list(arr)
    arr.each_with_index do |word, i|
      puts (i+1).to_s + ". " + word
    end
  end

  def run(results)
    dialogue_array = character_dialogue_arr(results)
    cleaned_dialogue_array = remove_non_letters(dialogue_array)
    counts_hash = count_words(cleaned_dialogue_array)
    sorted_counts = sorted_count(counts_hash)
    top_five = top_five(sorted_counts)
    print_list(top_five)
  end
end

class DialogueQuery
  def self.database_connection
    PG::Connection.open(:dbname => 'seinfeld')
  end

  def self.for_character(name)
    database_dialogue = database_connection.exec("
      SELECT dialogue
      FROM dialogues
      JOIN characters
      ON dialogues.character_id = characters.id
      WHERE characters.name = '#{name}'
    ;")
    database_dialogue.values
  end
end

def main
  puts 'choose JERRY, ELAINE, GEORGE, or KRAMER'
  input = gets.chomp
  puts "you selected #{input}"

  results = DialogueQuery.for_character(input)
  TopWords.new.run(results)
end

if __FILE__ == $0
  main
end
