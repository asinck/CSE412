#!/bin/bash



#This script creates the database, creates the tables, and fills it
#with generated data. It assumes that the database doesn't exist.

#first, make the DB
#./make_db.sql

echo "Enter database username. "
read username

echo "Enter database password. "
read password


mysql -u "$username" --password="$password" < schema.sql

#now fill with data
#The datagen python script uses multiple pages for word lists:
# http://www.enchantedlearning.com/wordlist/adjectives.shtml
# http://www.talkenglish.com/vocabulary/top-1500-nouns.aspx
# http://www.babynamewizard.com/the-top-1000-baby-names-of-2013-united-states-of-america
# http://names.mongabay.com/data/1000.html (surnames)
# https://www.biggestuscities.com/
# http://www.media-match.com/usa/music/jobtypes/job-descriptions.php (I used emacs macros to strip everything but the names)
# https://en.wikipedia.org/wiki/List_of_music_venues , United States section. This was a pain to work with.
# http://www.enchantedlearning.com/music/instruments/ (copied by hand)

#data was minimally filtered, due to amounts.

#unzip the words used to generate the DB data.
unzip data.zip
#run the program
python2.7 datagen.py "$username" "$password"
#get rid of the files
rm data_*.txt
