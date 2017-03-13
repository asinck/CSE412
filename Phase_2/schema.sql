-- This script generates a new database, called CSE412. It then makes
-- tables.

drop database if exists CSE412;
create database CSE412;
use CSE412;

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
    INDEX (person_name, person_birthdate),
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate),
    FOREIGN KEY (band_name, band_start_date) REFERENCES band (band_name, band_start_date)
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
    INDEX (person_name, person_birthdate),
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate, member_start_date),
    FOREIGN KEY (band_name, band_start_date) REFERENCES band (band_name, band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (person_name, person_birthdate) REFERENCES person (person_name, person_birthdate)
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
    from_date DATE,
    to_date DATE,
    INDEX (person_name, person_birthdate),
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate, from_date, to_date),
    FOREIGN KEY (band_name, band_start_date) REFERENCES band (band_name, band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (person_name, person_birthdate) REFERENCES person (person_name, person_birthdate)
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
    INDEX (person_name, person_birthdate),
    INDEX (instrument_name),
    PRIMARY KEY (band_name, band_start_date, person_name, person_birthdate, instrument_name),
    FOREIGN KEY (band_name, band_start_date) REFERENCES band (band_name, band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (person_name, person_birthdate) REFERENCES person (person_name, person_birthdate)
      ON DELETE CASCADE
      ON UPDATE CASCADE,    
    FOREIGN KEY (instrument_name) REFERENCES instrument (instrument_name)
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
    band_is_headliner BIT,
    PRIMARY KEY (band_name, band_start_date, tour_name, tour_start_date),
    FOREIGN KEY (band_name, band_start_date) REFERENCES band (band_name, band_start_date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );

CREATE TABLE concert
  (
    band_name VARCHAR (50),
    band_start_date DATE,
    tour_name VARCHAR (50),
    tour_start_date DATE,
    concert_time DATETIME,
    concert_day DATE,
    concert_city VARCHAR (50),
    concert_venue VARCHAR (50),
    PRIMARY KEY (band_name, band_start_date, tour_name, tour_start_date, concert_day, concert_time),
    FOREIGN KEY (band_name, band_start_date, tour_name, tour_start_date) REFERENCES tour (band_name, band_start_date, tour_name, tour_start_date)
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
    FOREIGN KEY (band_name, band_start_date) REFERENCES band (band_name, band_start_date)
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
    FOREIGN KEY (band_name, band_start_date, album_name, album_release_year) REFERENCES album (band_name, band_start_date, album_name, album_release_year)
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
    FOREIGN KEY (band_name, band_start_date, album_name, album_release_year, song_number) REFERENCES song (band_name, band_start_date, album_name, album_release_year, song_number)
      ON DELETE CASCADE
      ON UPDATE CASCADE
  );
