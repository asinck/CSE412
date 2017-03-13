#!/usr/bin/python


##################################################
## Run the .sh, not this.
##################################################

'''
The purpose of this script is to generate large amounts of random
data. The random generator will be seeded so that the same data set
can be generated.
'''

import MySQLdb
import random as r
import datetime
import sys

#This is an arbitrary seed.
r.seed(1)

# username = raw_input("username?  ")
# password = raw_input("password?  ")
username = sys.argv[1]
password = sys.argv[2]

print "Using %s : %s" %(username, password)
#This command, along with every other type of python sql command,
#brought to you by stackoverflow
try:
    db = MySQLdb.connect(host = "localhost",    # your host, usually localhost
                         user = username,       # your username
                         passwd = password,     # your password
                         db = "CSE412")         # name of the database
except:
    print "Error: could not connect to database."
    exit(1)

adjectives = []
cities = []
names = []
nouns = []
instruments = []
roles = []
surnames = []
venues = []

with open("data_adjectives.txt") as f:
    adjectives = f.read().splitlines()
with open("data_cities.txt") as f:
    cities = f.read().splitlines()
with open("data_names.txt") as f:
    names = f.read().splitlines()
with open("data_nouns.txt") as f:
    nouns = f.read().splitlines()
with open("data_instruments.txt") as f:
    instruments = f.read().splitlines()
with open("data_roles.txt") as f:
    roles = f.read().splitlines()
with open("data_surnames.txt") as f:
    surnames = f.read().splitlines()
with open("data_venues.txt") as f:
    venues = f.read().splitlines()


##################################################
## Data generation functions
##################################################
    
#this function generates a first/last name combination
def generatePersonName():
    return r.choice(names) + " " + r.choice(surnames)

#this function generates an adjective/noun pair
def generateName():
    return r.choice(adjectives) + " " + r.choice(nouns)

#this returns a random instrument name
def generateInstrumentName():
    return r.choice(instruments)

#this function generates a role for staff
def generateRole():
    return r.choice(roles)

def generateFeaturedArtistRole():
    return r.choice(["singer", "lead singer", "drums", "guitar", "piano"])
#generate a city
def generateCity():
    return r.choice(cities)

#generate a venue
def generateVenue():
    return r.choice(venues)

#this generates a random date, in sql format
# see https://gist.github.com/knu2xs/8ca7e0a39bf26f736ef7
def generateDate(after="1950-00-00"):
    y, m, d = [int(i) for i in after.split("-")]
    date = datetime.datetime.strptime('{} {}'.format(r.randint(1, 366), r.randint(y, 2016)), '%j %Y')
    return str(date.date())

#this generates a pair of random dates, in sql format. The earlier
#date is first in the returned tuple.
# see https://gist.github.com/knu2xs/8ca7e0a39bf26f736ef7
def generateDateRange(after="1950-00-00"):
    y, m, d = [int(i) for i in after.split("-")]
    firstDate = datetime.datetime.strptime('{} {}'.format(r.randint(1, 366), r.randint(y, 2016)), '%j %Y')
    secondDate = datetime.datetime.strptime('{} {}'.format(r.randint(1, 366), r.randint(y, 2016)), '%j %Y')
    if (secondDate < firstDate):
        firstDate, secondDate = secondDate, firstDate

    return (str(firstDate.date()), str(secondDate.date()))


#generate a time
def generateTime():
    hour = generateInt(0, 23)
    minute = generateInt(0, 59)
    second = generateInt(0, 59)
    return "1000-01-01 %d:%d:%d" %(hour, minute, second)

#this is a random number chooser. Not much more than an alias.
def generateInt(minimum=1, maximum=50):
    return r.randint(minimum, maximum)

#this returns a random bit.
def generateBit():
    return r.choice([0, 1])



##################################################
## random choice functions
##################################################

#this function gives 50/50 odds
def flipCoin():
    return r.choice([True, False]);

#this usually returns False, but might return True
#the output range for r.randint(a, b) is [a, b]
def unlikely(odds=50):
    return r.randint(0, odds) == 0

#this usually returns True, but might return False
#the output range for r.randint(a, b) is [a, b]
def likely(odds=50):
    return r.randint(0, odds) != 0


    
""".
These are the tables:
band
person
band_member
staff
instrument
plays
tour
concert
album
song
featured_artist

These tables are independent:
band
instrument

These tables have the following dependencies:
band               --> --
person             --> band
band_member        --> band, person
staff              --> band, person
instrument         --> --
plays              --> band, person, instrument
tour               --> band
concert            --> tour
album              --> band
song               --> album
featured_artist    --> song


Flattening so that each line shows the full dependency path back to
the root table,

band               --> --
person             --> band
band_member        --> band, person
staff              --> band, person
instrument         --> --
plays              --> band, person, instrument
tour               --> band
concert            --> tour, band
album              --> band
song               --> album, band
featured_artist    --> song, album, band

strategy: root down. Create a bunch of bands, and for each of those
bands make correlated entities. This gives automatic fulfillment of
dependencies, with minimal logic.

Note that only one table depends on instrument, but that table also
depends on band. instuments will be generated first so the script
doesn't have to keep track of more than it has to. It will just grab
random instruments from the table as needed.

This is roughly what it will look like for structure, if each line is
embedded in a for loop:

genInstrument()

genBandName()
    genBandMember() (is a person)
    genStaff() (is a person)
    genPlays()
    genTour()
        genConcert()
    genAlbum()
        genSong()
            genFeaturedArtist() #maybe; this should be a novelty occurrence

"""

# you must create a Cursor object. It will let
#  you execute all the queries you need

cur = db.cursor()

#ok, now that we know the structure, we need to establish some real
#numbers.
NUM_INSTRUMENTS = r.randint(5, 10)
NUM_BANDS = r.randint(1000, 5000)

#this is a list of instruments that are actually used.
usedInstruments = []

# print "Loading %i instruments." %NUM_INSTRUMENTS
# for instrumentNumber in range(NUM_INSTRUMENTS):
#     print "%2.2f%% done." %(((instrumentNumber*1.0)/NUM_INSTRUMENTS)*100)

# print "Instrument data generation completed."



#unless I missed something, anything from the sql schema should be in
#snakecase to match the schema and indicate that it's an sql var.

print "Loading %i bands." %NUM_BANDS
print "Come back in five minutes."
for bandNumber in range(NUM_BANDS):

    #generate band data
    band_name = generateName()
    band_start_date, band_end_date = generateDateRange()
    band_rating = generateInt()
    command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}')".format("band", band_name, band_start_date, band_end_date, band_rating)
    cur.execute(command)
    db.commit()
    #generate people data

    #I only need to generate data for the subclasses of person; for
    #each subclass record generated, add the relevant data to person
    numBand_Member = generateInt(1, 10)
    for band_member in range(numBand_Member):
        #generate person data
        person_name = generatePersonName()
        person_birthdate = generateDate()
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}')".format("person", band_name, band_start_date, person_name, person_birthdate)
        cur.execute(command)
        #generate the additional band member attributes
        member_start_date, member_end_date = generateDateRange(band_start_date)
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', '{}')".format("band_member", band_name, band_start_date, person_name, person_birthdate, member_start_date, member_end_date)
        cur.execute(command)
        db.commit()

    #staff
    numStaff = generateInt(1, 10)
    for staff in range(numStaff):
        #generate person data
        person_name = generatePersonName()
        person_birthdate = generateDate()
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}')".format("person", band_name, band_start_date, person_name, person_birthdate)
        cur.execute(command)
        #generate the additional staff attributes
        staff_role = generateRole()
        staff_from_date, staff_to_date = generateDateRange(band_start_date)
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}')".format("staff", band_name, band_start_date, person_name, person_birthdate, staff_role, staff_from_date, staff_to_date)
        cur.execute(command)

    #plays
    numPlays = generateInt(1, 5)
    for Plays in range(numPlays):
        #generate person data
        person_name = generatePersonName()
        person_birthdate = generateDate()
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}')".format("person", band_name, band_start_date, person_name, person_birthdate)
        cur.execute(command)
        #generate the additional staff attributes
        instrument_name = generateInstrumentName()
        if (instrument_name not in usedInstruments):
            usedInstruments.append(instrument_name)
            #make an instrument real quick
            command = "INSERT IGNORE INTO {} VALUES ('{}')".format("instrument", instrument_name)
            cur.execute(command)
        #ok go ahead
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}')".format("plays", band_name, band_start_date, person_name, person_birthdate, instrument_name)
        cur.execute(command)
        
    #generate tour data
    numTours = generateInt(1, 5)
    for tour in range(numTours):
        tour_name = generateName()
        tour_start_date, tour_end_date = generateDateRange(band_start_date)
        band_is_headliner = generateBit()
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', b'{}')".format("tour", band_name, band_start_date, tour_name, tour_start_date, tour_end_date, band_is_headliner)
        cur.execute(command)

        #generate concert data
        numConcerts = generateInt(3, 8)
        for concert in range(numConcerts):
            concert_time = generateTime()
            concert_day = generateDate(tour_start_date)
            concert_city = generateCity()
            concert_venue = generateVenue()
            command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')".format("concert", band_name, band_start_date, tour_name, tour_start_date, concert_time, concert_day, concert_city, concert_venue)
            cur.execute(command)

    #generate album data
    numAlbums = generateInt(1, 20)
    #an initial record label
    album_record_label = generateName()
    for album in range(numAlbums):
        album_name = generateName()
        #maybe change the record label; this allows for multiple
        #albums to have the same record label
        if (flipCoin()):
            album_record_label = generateName()
        album_type = generateInt(1, 5)
        album_release_year = generateInt(1950, 2016)
        command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', '{}')".format("album", band_name, band_start_date, album_name, album_record_label, album_type, album_release_year)
        cur.execute(command)

        #generate song data
        numSongs = generateInt(5, 25)
        for song in range(1, numSongs+1):
            song_name = generateName()
            song_number = song
            song_billboard_rating = generateInt(1, 5000)
            command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}')".format("song", band_name, band_start_date, album_name, album_release_year, song_name, song_number, song_billboard_rating)
            cur.execute(command)
            #maybe add a featured artist to the song
            if (unlikely()):
                feat_artist_name = generatePersonName()
                feat_artist_role = generateFeaturedArtistRole()
                command = "INSERT IGNORE INTO {} VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}')".format("featured_artist", band_name, band_start_date, album_name, album_release_year, song_number, feat_artist_name, feat_artist_role)
                cur.execute(command)
            
        



    # scope.pop()
#    print "%2.2f%% done." %(((bandNumber*1.0)/NUM_BANDS)*100)

print "Data generation completed."


#close the database now that we're done with it
db.close()

