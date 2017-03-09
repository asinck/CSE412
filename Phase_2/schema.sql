CREATE TABLE band
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    band_end_date DATE,
    band_billboard_rating INT,
    PRIMARY KEY (band_name, band_start_date)
  );

CREATE TABLE person
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    person_name VARCHAR (50),
    person_birthdate DATE,
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE band_member
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    person_name VARCHAR (50),
    person_birthdate DATE,
    member_start_date DATE,
    member_end_date DATE,
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate, member_start_date),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (person_name) REFERENCES person (person_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (person_birthdate) REFERENCES person (person_birthdate)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE staff
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    person_name VARCHAR (50),
    person_birthdate DATE,
    staff_role VARCHAR (50),
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (person_name) REFERENCES person (person_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (person_birthdate) REFERENCES person (person_birthdate)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE instrument
  (
    instrument_name VARCHAR (50),
    PRIMARY KEY (instrument_name)
  );

CREATE TABLE plays
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    person_name VARCHAR (50),
    person_birthdate DATE,
    instrument_name VARCHAR (50),
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate, instrument_name),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (person_name) REFERENCES person (person_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (person_birthdate) REFERENCES person (person_birthdate)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE tour
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    tour_name VARCHAR (50),
    tour_start_date DATE,
    tour_end_date DATE,
    PRIMARY KEY (band_name, band_start_date, tour_name, tour_start_date),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE goes_on
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    tour_name VARCHAR (50),
    tour_start_date DATE,
    band_is_headliner BIT,
    PRIMARY KEY (band_name, band_start_date, tour_name, tour_start_date, band_is_headliner),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (tour_name) REFERENCES tour (tour_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (tour_start_date) REFERENCES tour (tour_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE concert
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    tour_name VARCHAR (50),
    tour_start_date DATE,
    concert_time VARCHAR (10),
    concert_day DATE,
    concert_city VARCHAR (50),
    concert_venue VARCHAR (50),
    PRIMARY KEY (band_name, band_start_date, tour_name, tour_start_date, concert_day, concert_time),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (tour_name) REFERENCES tour (tour_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (tour_start_date) REFERENCES tour (tour_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE album
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    album_name VARCHAR (50),
    album_record_label VARCHAR (50),
    album_type INT,
    album_release_year INT,
    PRIMARY KEY (band_name, band_start_date, album_name, album_release_year),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE song
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    album_name VARCHAR (50),
    album_release_year INT,
    song_name VARCHAR (50),
    song_number INT,
    song_billboard_rating INT,
    PRIMARY KEY (band_name, band_start_date, album_name, album_release_year, song_number),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (album_name) REFERENCES album (album_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (album_release_year) REFERENCES album (album_release_year)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE featured_artist
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    album_name VARCHAR (50),
    album_release_year INT,
    song_number INT,
    feat_artist_name VARCHAR (50),
    feat_artist_role VARCHAR (50),
    PRIMARY KEY (band_name, band_start_date, album_name, album_release_year, song_number, feat_artist_name),
    FOREIGN KEY (band_name) REFERENCES band (band_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (band_start_date) REFERENCES band (band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (album_name) REFERENCES album (album_name)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (album_release_year) REFERENCES album (album_release_year)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (song_number) REFERENCES song (song_number)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );