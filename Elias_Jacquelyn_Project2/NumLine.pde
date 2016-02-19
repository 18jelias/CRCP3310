class NumLine {
  int x;
  int y;
  int l;
  int tSize;
  int transparency;
  int display;

  NumLine(int x) {
    this.x=x;
    y=0;
    l=(int)random(10, 25);
    tSize=(int)random(24, 48);
    transparency=(int)random(60,100);
  }
  
  //draws lists of numbers
  void draw() {
    pushStyle();
    fill(50, 229, 90, transparency);
    textSize(tSize);
    for (int i=0; i<l; i++) {
      if(frameCount%2==0)display=(int)random(2);
      text(display, x, y+tSize*i);
    }
    popStyle();
  }
}

