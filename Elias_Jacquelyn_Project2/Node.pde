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
    if (s=="add") location.x=random(width/2);
    else if (s=="delete") location.x=random(width/2,width);
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

