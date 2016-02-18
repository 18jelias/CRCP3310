class NumLine {
  int x;
  int y;
  int l;
  int tSize;

  NumLine(int x) {
    this.x=x;
    y=0;
    l=(int)random(20, 35);
    tSize=(int)random(12, 24);
  }

  void draw() {
    int transparency = 200;
    if (transparency>255) transparency--;
    else if (transparency<150) transparency++;
    fill(50, 229, 90, transparency);
    textSize(tSize);
    for (int i=0; i<l; i++) {
      int display=(int)random(2);
      text(display, x, y+tSize*l);
    }
  }
}

