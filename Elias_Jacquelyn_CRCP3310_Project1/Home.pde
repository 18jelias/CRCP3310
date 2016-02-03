class Home {
  Button frequency;
  Button letter;
  Button text;
  PFont font;

  Home() {
    frequency= new Button(width/2, 125, 300, 187, (color(215, 221, 232)), "Frequency", 56, loadFont("Chalk-hand-lettering-shaded_demo-48.vlw"), "frequency1.png");
    letter= new Button(width/2, 500, 300, 187, color(215, 221, 232), "Letter", 56, loadFont("Chalk-hand-lettering-shaded_demo-48.vlw"), "letters.png");
    font = loadFont("Chalk-hand-lettering-shaded_demo-48.vlw");
  }

  void draw() {
    background(0);
    drawButtons();
    drawText();
  }

  void drawButtons() {
    pushStyle();
    tint(255, 100);
    frequency.draw();
    letter.draw();
    popStyle();
  }

  void drawText() {
    pushStyle();
    fill(147, 25, 33);
    textFont(font, 75);
    text("Grimm's Fairy Tales", width/9, height/2);
    popStyle();
  }

  void whenPressed() {
    if (frequency.isClicked()) {
      state=FREQUENCY_PAGE;
    } else if (letter.isClicked()) {
      state=LETTER_PAGE;
    } 
  }
}

