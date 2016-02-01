import controlP5.*;

BufferedReader reader;
final String FILENAME = "Grimms.txt";
PImage letterViz;

int state;
final int DRAW_LETTER_STATE = 0;
final int ASCII_OFFSET = 97;
final int DRAW_FREQUENCIES_STATE = 1;

final int LETTERS_IN_ALPHABET = 26;
int[] frequencies = new int[LETTERS_IN_ALPHABET];

void setup() {
  size(420, 420);
  state = DRAW_LETTER_STATE;
  letterViz = createImage(420,420,RGB);    
  letterViz.loadPixels();
  prepareFrequencies();    
}



void draw() {
  background(255);
  if (state == DRAW_LETTER_STATE) {
    drawLetterVisualization();
  } else {
    drawFrequencyGraph();
  }
}

void mousePressed() {
  state = (state + 1) % 2;
}

//we give file name and processing 
