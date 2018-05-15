# Seinfeld Dialog Analyzer

## Description

This project is designed as a self-assigned exercise in vanilla Ruby and PostgreSQL. It uses a simple script to import dialogue from a CSV of the Seinfeld script (all 9 seasons) into a Postgres database. Logic is written to play with this data and perform basic analysis.

## Setup

* Clone this repository
* Navigate to project folder
* Install gems with `$ bundle install`
* Create local database called 'seinfeld'
* Populate database: `$ ruby create_database.rb`
* Run program in terminal: `$ ruby lib/seinfeld.rb`


## Current Functionality
* Joins characters and dialogues tables to return dialogue values based on character name input
* SQL queries adjusted to account for data anomalies (misplaced commas, missing character names, etc.)
* Logic written to create an array of words for the given character, remove any punctuation, use hash to count occurrence of each word.
* Returns top 5 most used words
* Formatted to return numbered list in the terminal


## Future Functionality
* Remove most commonly used words (top 5 returns "the, to, a, and...")
* Return list of characters for each season in order of who has the most lines
* Determine "wordy" characters. For example, because George talks so fast, does he actually get more words in but have fewer lines?
* Determine whether or not characters get more lines based on audience favorites. Does Kramer get significantly more lines or integrated into the story as his popularity grows?


## Technologies Used

* Ruby
* PostgreSQL

## License

Licensed under the MIT License.

Copyright (c) 2018 Emily Watkins
