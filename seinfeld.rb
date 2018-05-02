require 'pg'
require 'csv'
require 'set'

DB = PG::Connection.open(:dbname => 'seinfeld')

puts 'choose JERRY, ELAINE, GEORGE, or KRAMER'
input = gets.chomp
puts "you selected #{input}"

database_dialogue = DB.exec("
  SELECT dialogue
  FROM dialogues
  JOIN characters
  ON dialogues.character_id = characters.id
  WHERE characters.name = '#{input}'
;")

results = database_dialogue.values

def character_dialogue_arr(database_values)
  all_dialogue = []
  database_values.each do |value| # result is an array containing a string
    words = value.to_s.split(' ')
    words.each do |word|
      all_dialogue.push(word)
    end
  end
  return all_dialogue
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
  return counts
end

def sorted_count(hash)
  sorted = hash.sort_by { |k, v| v }.reverse[0..4]
end

def top_five(arr)
  top_five_words = arr.map { |k, v| k }
end

def print_list(arr)
  arr.each_with_index do |word, i|
    puts (i+1).to_s + ". " + word
  end
end

dialogue_array = character_dialogue_arr(results)
cleaned_dialogue_array = remove_non_letters(dialogue_array)
counts_hash = count_words(cleaned_dialogue_array)
sorted_counts = sorted_count(counts_hash)
top_five = top_five(sorted_counts)
print_list(top_five)
