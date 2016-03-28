#!/usr/bin/env ruby

#Jacquelyn Elias
#Project 4
#This project manages a song database by allowing you to see and edit
#artists, albums, genres and songs 

require 'sqlite3'

DB_FILE_NAME="songs.sqlite3.db"
SQL_SELECT_GENRES = "SELECT name FROM genres;"
SQL_SELECT_ALBUMS = "SELECT name FROM albums"
SQL_SELECT_ARTISTS = "SELECT name FROM artists"

STATE_MENU = 0
STATE_ALLSONGS = 1
STATE_GENRE = 2
STATE_ALBUM = 3
STATE_ARTIST = 4
STATE_SONG = 5

state = 0
input = 0;


def display_menu
	puts "Welcome to the music database!"
	puts "	1. Display all song information."
	puts "	2. Add a new genre."
	puts "	3. Add a new album."
	puts "	4. Add a new artist"
	puts "	5. Add a new song"
	puts "Enter a choice:"
end


def display_genres
	db = SQLite3::Database.new(DB_FILE_NAME)
	db.execute(SQL_SELECT_GENRES) do |row| #iterator 
		puts row
	end
	db.close
end

def input_genres
	puts "New genre name:"
	new_name = gets.chomp
end


def display_album
	db = SQLite3::Database.new(DB_FILE_NAME)
	db.execute(SQL_SELECT_ALBUMS) do |row| #iterator 
		puts row
	end
	db.close
end

def input_album;
	puts "New album name:"
	new_album = gets.chomp
end


def display_artist
	db = SQLite3::Database.new(DB_FILE_NAME)
	db.execute(SQL_SELECT_ARTISTS) do |row| #iterator 
		puts row
	end
	db.close
end

#Main Loop

display_menu;
input = gets.chomp


if input == "1"
elsif input == "2"
	puts "0k"
	display_genres;
	input_genres;
elsif input == "3"
	display_album;
	input_album;
elsif input == "4"
	display_artists;
	input_artists;
elsif input == "5"
end



#puts "Add an album..."
#puts "Enter the album name:"
#album_name = gets.chomp
#db.execute("SELECT * FROM artists;") do |row|
#	puts  "#{row[0]"
#When you add an album...Enter the name fo the album:
#After show the artist and allow them to pick a artist name