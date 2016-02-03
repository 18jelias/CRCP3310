class Frequency {
  Node[] balls = new Node[LETTERS_IN_ALPHABET];
   PFont font; 
  Frequency() {
    for (int i = 0; i < balls.length; i++) {
      balls[i] = new Node(i, balls);
    }
    font = loadFont("Chalk-hand-lettering-shaded_demo-48.vlw");
  }


  void draw() {
    background(0);
    pushMatrix();
    for (int i = 0; i < balls.length; i++) {
      balls[i].draw();
      balls[i].move();
      //balls[i].collide();
    }
    textFont(font, 48);
    text("Frequency of word king: "+frequencyOfKing, width/6, 50);
    popMatrix();
    
    /*
    pushMatrix();
    int widthPerLetter = width/LETTERS_IN_ALPHABET;
    int numOfLetter=ASCII_OFFSET;
    for (int w=widthPerLetter; w<width; w=w+widthPerLetter) {

      text(char(numOfLetter), w, height-100);
      drawValues(w, numOfLetter);
      numOfLetter++;
    }

    popMatrix();
    */
  }


  void whenPressed() {
    state=HOME_PAGE;
  }

/*
  void drawValues(int w, int numOfLetter) {
    
    int radius[] = new int[LETTERS_IN_ALPHABET];
    int numOfCircle[] = new int[LETTERS_IN_ALPHABET];
    int yLoc[] = new int[LETTERS_IN_ALPHABET];
    int index = numOfLetter-ASCII_OFFSET;
    int frequencyPerCircle = 1000;

    for (int i=0; i<LETTERS_IN_ALPHABET; i++) {
      radius[i]= (int)random(10, 20);
      yLoc[i]= (int)random(-5, 5);
      numOfCircle[i]=frequencies[i]/frequencyPerCircle;
    }
    int h = height - 150;
    //int frequencyPerCircle = maxChar-ASCII_OFFSET/500; 
    if (numOfCircle[index]==0) {
      ellipse(w+10, height-150, radius[index], radius[index]);
    } else {
      for (int i = 0; i<numOfCircle[index]; i++) {
        ellipse(w+yLoc[index], h, radius[index], radius[index]);
        h-=10;
      }
    }

  }    */
}

