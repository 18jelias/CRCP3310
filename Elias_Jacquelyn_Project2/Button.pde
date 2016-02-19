class Button {

  int x;
  int y;
  int l;
  int w;
  color c;
  color hover;
  String s;
  int tSize;
  PFont bFont;
  PImage image;

  Button() {
    this(width / 2, height / 2, "Enter");
  }

  Button(int x, int y, String s) {
    this(x, y, color(100, 100, 100, 180), s);
  }

  Button(int x, int y, int l, int w, color c, String s) {
    this(x, y, l, w, c, s, 32, loadFont("Avenir-Roman-48.vlw"), "file");
  }

  Button(int x, int y, color c, String s) {
    this(x, y, 160, 65, c, s, 32, loadFont("Avenir-Roman-48.vlw"), "file");
  }

  Button(int x, int y, int l, int w, color c, String s, int tSize, String file) {
    this(x, y, l, w, c, s, tSize, loadFont("Avenir-Roman-48.vlw"), file);
  }

  Button(int x, int y, int l, int w, color c, String s, int tSize, PFont bFont, String file) {
    this.x = x; 
    this.y = y;
    this.l = l;
    this.w = w;
    this.c = c;
    this.s = s;
    this.tSize = tSize;
    this.bFont = bFont;
    image = loadImage(file);
  }


  boolean isClicked() {
    if ((mouseX >= x - l / 2 && mouseX <= (x + l / 2)) && 
      (mouseY >= y - w / 2 && mouseY <= (y + w / 2))) {
      return true;
    } else {
      return false;
    }
  }

  boolean isHovered() {
    if ((mouseX >= x - l / 2 && mouseX <= (x + l / 2)) && 
      (mouseY >= y - w / 2 && mouseY <= (y + w / 2))) {
      return true;
    } else {
      return false;
    }
  }


  void draw() {
    pushStyle();
    hover=color(209, 202, 202);
    if (isHovered()) {
      fill(hover);
    } else {
      fill(c);
    }
    rectMode(CENTER);
    rect(x, y, l, w);
    imageMode(CENTER);
    //image(image, x, y, l, w);
    textAlign(CENTER, CENTER);
    textFont(bFont, tSize);
    fill(color(29, 157, 167));
    text(s, x, y, l, w);
    popStyle();
  }
}

