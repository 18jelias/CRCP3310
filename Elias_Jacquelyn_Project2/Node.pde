class Node {
  PVector location;
  int diameter;
  color c;
  int value;

  Node() {
    this(new PVector(random(width),random(height)), color(random(255), random(255), random(255)));
  }
  
  Node(String s) {
    c=color(random(255),random(255),random(255));
    location=new PVector();
    location.y=random(height);
    if (s=="add") {
      int temp = (int)random(2);
      if (temp==0) location.x=random(280);
      else location.x=random(620, 880);
    } else if (s=="delete") {
      int temp = (int)random(2);
      if (temp==0) location.x=random(320,580);
      else location.x=random(920, 1180);
    }
    value = (int)random(360);
    diameter=30;
  }
  
  Node(PVector location, color c) {
    this.location=location;
    diameter = 30;
    this.c=c;
    value = (int)random(360);
  }

  void draw() {
    fill(c);
    ellipse(location.x, location.y, diameter, diameter);
    value = (int)hue(c);
  }
  
  int isTouched() {
    return value;
  }
}

