class Letter {

  Letter() {
      preparePalette();
      letterViz = createImage(700,700,RGB);    
      letterViz.loadPixels();
  }
  void draw() {
    background(0);
    drawLetters();
    image(letterViz, 0, 0);
  }

  void whenPressed() {
    state=HOME_PAGE;
  }

  void drawLetters() {
    reader = createReader(FILENAME);
    int pixelPosition = 0;
    try {
      int input;
      while ( (input = reader.read ()) != -1) {
        if (!Character.isAlphabetic(input)) continue;
        if(input==' ' || input=='.') {
          letterViz.pixels[pixelPosition] = color(0);
        }
        char letter = (char)Character.toLowerCase(input);
        ;
        letterViz.pixels[pixelPosition] = palette[letter-ASCII_OFFSET];
        pixelPosition++;
      }
      reader.close();
    } 
    catch (IOException e) { //what?
      println("Could not read data");
      e.printStackTrace();
      noLoop();
    }
  }
  
  void preparePalette() {
  for (int i = 0; i < LETTERS_IN_ALPHABET; i++) {
    if (i < 9) {
      palette[i] = color(random(150,255), random(150,255), random(0,50));
    } else if (i < 18) {
      palette[i] = color(random(150,255), random(0,50), random(150,255));
    } else {
      palette[i] = color(random(0,50), random(150,255), random(150,255));
    }
  } 
}
}

