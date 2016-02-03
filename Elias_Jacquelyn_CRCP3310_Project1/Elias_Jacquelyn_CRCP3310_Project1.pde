/*
    Jacquelyn Elias
    Project 1:
    This project depicts 
*/
import controlP5.*;

BufferedReader reader;
final String FILENAME = "Grimms.txt";
PImage letterViz;

int state;
final int LETTER_PAGE = 0;
final int ASCII_OFFSET = 97;
final int FREQUENCY_PAGE = 1;
final int HOME_PAGE = 2;

final int LETTERS_IN_ALPHABET = 26;
int[] frequencies = new int[LETTERS_IN_ALPHABET];
color[] palette = new color[LETTERS_IN_ALPHABET];

int frequencyOfKing=0;
int minChar=0;
int maxChar=0;

Frequency frequency;
Home home;
Letter letter;

void setup() {
  size(750, 750);
    prepareFrequencies(); 
  frequency = new Frequency();
  home = new Home();
  letter = new Letter();
  state = HOME_PAGE;
}



void draw() {
  background(255);
  if (state == LETTER_PAGE) {
    letter.draw();

  } else if (state == FREQUENCY_PAGE) {
    frequency.draw();
  } else if (state == HOME_PAGE) {
    home.draw();
  } 
}

void mousePressed() {
  if (state == LETTER_PAGE) {
    letter.whenPressed();
  } else if (state == FREQUENCY_PAGE) {
    frequency.whenPressed();
  } else if (state == HOME_PAGE) {
    home.whenPressed();
  } 
}

//we give file name and processing 
