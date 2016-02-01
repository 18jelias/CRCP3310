void drawFrequencyGraph() {
  background(0);
  text("I IS GRAPH.", 100, 100);
}

void drawLetterVisualization() {
  background(0);
  text("Drawing letters.", 100, 100);
  image(letterViz, 0, 0);
}
  

void prepareFrequencies() {
  for (int i = 0; i < LETTERS_IN_ALPHABET; i++) {
    frequencies[i]=0;
  }
  reader = createReader(FILENAME);
  try {
    int input;
    while ((input = reader.read()) != -1) {
      if (!Character.isAlphabetic(input)) continue;
      char letter = (char)Character.toLowerCase(input);
      frequencies[letter - ASCII_OFFSET]++;
      letterViz.pixels[pixelPosition] = pallette[0];
      if (letter == 'a' {
        letterViz.pixels[pixelPosition] = pallette[0];
      } else if (letter == 'n') {
        letterViz.pixels[pixelPosition] = pallete[0]
      } else {
        letterViz.pixels[pixelPosition] = color(0);
      }
      pixelPosition++;
    }
    println(frequencies);
  } catch (IOException e) { //what?
    println("Could not read data");
    e.printStackTrace();
    noLoop();
  }
}

/*How to fin Alice
  Conver tot string anddo string search fp wpd
  -Manually serhc for "0..9)
  */
  
