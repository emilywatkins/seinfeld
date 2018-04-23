require 'pg'
require 'csv'

DB = PG::Connection.open(:dbname => 'seinfeld')

DB.exec("CREATE TABLE characters (
  name VARCHAR,
  id SERIAL PRIMARY KEY
);")

DB.exec('INSERT INTO characters (name) VALUES ("JERRY"), ("ELAINE"), ("GEORGE"), ("KRAMER");')

DB.exec('CREATE TABLE dialogues (
  dialogue VARCHAR,
  character_id INTEGER REFERENCES characters(id)
);')

CSV.foreach('scripts.csv', headers: true) do |row|
  DB.exec("INSERT INTO dialogues (dialogue, character_id) VALUES ('#{DB.escape_string(row[2] || "")}', (SELECT min(id) FROM characters WHERE '#{DB.escape_string(row[1])}' ILIKE '%' || name || '%'));")
end
