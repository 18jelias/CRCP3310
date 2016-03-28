#!/usr/bin/env ruby

#Jacquelyn Elias
#Project 4
#This project manages a song database by allowing you to see and edit
#artists, albums, genres and songs 

require 'sqlite3'

DB_FILE_NAME="songs.sqlite3.db"
SQL_SELECT_SONGS = "SELECT 
						songs.name AS Song, genres.name AS Genre, albums.name AS Album
					FROM songs 
					LEFT JOIN genres ON songs.genre_id=genres.id
					LEFT JOIN albums ON songs.album_id=albums.id
					;" 
SQL_SELECT_GENRES = "SELECT name FROM genres;"
SQL_SELECT_ALBUMS = "SELECT name FROM albums"
SQL_SELECT_ARTISTS = "SELECT name FROM artists"

STATE_MENU = "0"
STATE_ALLSONGS = "1"
STATE_GENRE = "2"
STATE_ALBUM = "3"
STATE_ARTIST = "4"
STATE_SONG = "5"

state = 0
input = 0;

#Displays main menu
def display_menu
	puts "Welcome to the music database!"
	puts "	1. Display all song information."
	puts "	2. Add a new genre."
	puts "	3. Add a new album."
	puts "	4. Add a new artist"
	puts "	5. Add a new song"
	puts "Enter a choice:"
end


#Displays all song information
def display_all
	db = SQLite3::Database.new(DB_FILE_NAME)

	db.execute(SQL_SELECT_SONGS) do |row| #iterator 
		puts row
		puts "\n"
	end

	db.close	
end

#Displays all genres and inserts new genre
def display_genres
	db = SQLite3::Database.new(DB_FILE_NAME)
	db.execute(SQL_SELECT_GENRES) do |row| #iterator 
		puts row
	end
	puts "\n"
	puts "New genre name:"
	new_name = gets.chomp
	db.execute "INSERT INTO genres(name) VALUES('#{new_name}');"
	db.close
end

#Displays all artists and albums and adds new album
def display_album
	db = SQLite3::Database.new(DB_FILE_NAME)
	db.execute(SQL_SELECT_ARTISTS) do |row| #iterator 
		puts row
	end
	puts "\n"	
	puts "Select album artist:"
	new_artist = gets.chomp
	db.execute("SELECT name FROM albums") do |row| #iterator 
		puts row
	end
	puts "\n"	
	puts "New album name:"
	new_album = gets.chomp

	db.execute "INSERT INTO albums(name, artist_id) VALUES('#{new_album}', '#{new_artist}');"
	db.close
end

#Displays all artists and adds new artist
def display_artist
	db = SQLite3::Database.new(DB_FILE_NAME)
	db.execute(SQL_SELECT_ARTISTS) do |row| #iterator 
		puts row
	end
	puts "\n"	
	puts "New artist name:"
	new_artist = gets.chomp
	db.execute "INSERT INTO artists(name) VALUES('#{new_artist}');"	
	db.close
end

#Displays all genres and albums and adds new song
def display_song
	db = SQLite3::Database.new(DB_FILE_NAME)
	puts "Add a new song!"
	new_song = gets.chomp
	db.execute(SQL_SELECT_GENRES) do |row| #iterator 
		puts row
	end
	puts "\n"	
	puts "Choose the genre of the song:"
	new_genre = gets.chomp	
	db.execute("SELECT name FROM albums") do |row| #iterator 
		puts row
	end
	puts "\n"	
	puts "Choose the album of the song:"
	new_album = gets.chomp
	db.execute "INSERT INTO songs(name, genre_id, album_id) VALUES('#{new_song}', '#{new_genre}', '#{new_album}');"
	db.close
end

#Main Loop
go = true;
while go do
	display_menu;
	input = gets.chomp
	if input == "1"
		display_all;
	elsif input == "2"
		display_genres;
	elsif input == "3"
		display_album;
	elsif input == "4"
		display_artist;
	elsif input == "5"
		display_song;
	end
end



#puts "Add an album..."
#puts "Enter the album name:"
#album_name = gets.chomp
#db.execute("SELECT * FROM artists;") do |row|
#	puts  "#{row[0]"
#When you add an album...Enter the name fo the album:
#After show the artist and allow them to pick a artist name