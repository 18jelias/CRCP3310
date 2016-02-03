//Referenced code from Keith Peters for guidance https://processing.org/examples/bouncybubbles.html
class Node {
  char letter;
  int frequency;
  int index;
  float x; 
  float y;
  int size; 
  String specialTitle;
  int xDir;
  int yDir;
  float xSpeed;
  float ySpeed;
  Node[] nodes;
  PFont font; 


  Node(int index, Node[] balls) {
    this.index=index;
    nodes=balls;   
    frequency=frequencies[index];
    letter = char(index+ASCII_OFFSET); 
    if (char(minChar) == letter) {
      specialTitle="Minimum";
    } else if (char(maxChar) == letter) {
      specialTitle="Maximum";
    } else {
      specialTitle="0";
    }
    size = frequency/200;
    if (size==0) size=10;

    x = (int)random(100, width-100);
    y = (int)random(100, height-100);
    xDir = (int)random(-1, 1);
    yDir = (int)random(-1, 1); 
    if (index%5==0) {
      xDir = -1;
      yDir = 1;
      xSpeed=.5;
      ySpeed=1;
    } else if (index%2==0) {
      xDir=1;
      yDir=-1;
      xSpeed = .2;
      ySpeed=.8;
    } else {
      xDir=11;
      yDir=1;
      xSpeed=.6;
      ySpeed=1.3;
    }

    font= loadFont("Digitaltech-24.vlw");
  }

  void draw() {
    if (specialTitle!="0") {
      fill(palette[index]);
      ellipse(x, y, size, size);
      fill(255); 
      textFont(font, 48);
      text(letter, x, y);
      textSize(24);
      text(specialTitle, x-textWidth(specialTitle)/3, y-48);  
      text(frequency, x-20, y+24);
    } else {

      fill(palette[index]);
      ellipse(x, y, size, size);
      fill(255); 
      textFont(font, 48);
      text(letter, x, y); 
      textSize(24);
      text(frequency, x, y+24);
    }
  }

  void grow() {
    int theta=0;
    scale(cos(theta));
    theta+=0.01;
  }

  void whenHover() {
  }

  void isMouseHovered() {
  }

  void move() {
    x += xSpeed * xDir; 
    y += ySpeed * yDir; 

    if (((x+(size/2))>width) ||((x-(size/2))<0)) {
      xDir*=-1;
    } else if (((y-(size/2))<0)||((y+(size/2))> height)) {
      yDir*=-1;
    }
  }

  void collide() {
    for (int i=index+1; i<nodes.length; i++) {
      float run = nodes[index].x-x;
      float rise = nodes[index].y-y;
      float minDist = nodes[index].size/2 + size/2;

      if (calcDistanceBetween(i, run, rise) < minDist) {
        float angle = atan2(rise, run );
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - nodes[i].x);
        float ay = (targetY - nodes[i].y);
        x -= ax;
        y -= ay;
        nodes[i].x += ax;
        nodes[i].y += ay;
      }
    }
  }

  boolean bounce() {
    return true;
  }

  float calcDistanceBetween(int index, float run, float rise) {
    float distance = sqrt(run*run +rise*rise); 
    return distance;
  }
}

