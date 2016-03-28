import sqlite3

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SELECT_GENRES = "SELECT name FROM genres;"

db_connection = sqlite3.connect(DB_FILE_NAME)

cursor = db_connection.cursor() 

for row in cursor.execute(SQL_SELECT_GENRES):
	print(row)

db_connection.close()

