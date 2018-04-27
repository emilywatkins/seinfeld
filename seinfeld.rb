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
all_dialogue = []
words_arr = []

results.each do |result| # result is an array containing a string
  words = result.to_s.split(' ')
  words.each do |word|
    all_dialogue.push(word)
  end
end

all_dialogue.each do |word| # removes non-letter characters
  word.gsub!(/[^0-9a-z ]/i, '')
end

counts = Hash.new 0
all_dialogue.each do |word|
  counts[word] += 1
end

ordered_five = counts.sort_by { |k, v| v }.reverse[0..4]
# ordered_five = counts.select { |k, v| v>10 }
top_five_words = ordered_five.map { |k, v| k }
top_five_words.each_with_index do |word, i|
  puts (i+1).to_s + ". " + word
end
# puts "all dialogue array: ", all_dialogue
# puts "counted words: ", top_five_words
