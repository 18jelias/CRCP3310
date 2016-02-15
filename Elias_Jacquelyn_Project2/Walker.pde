class Walker {

  final int MAX_VELOCITY = 1;
  final float NOISE_DELTA= 0.01;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency;
  float xOffset;
  final int WIDTH = 100;

  public Walker(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 1);
    acceleration = new PVector(1,0);
    tendency = new PVector(1,0);
    xOffset = 0.0;
  }
  
  void draw() {
    stroke(random(255), random(255), random(255));
    ellipse(location.x, location.y, WIDTH, WIDTH);
  }
  
  
  public void walk() {
    acceleration = PVector.fromAngle(noise(xOffset)*TWO_PI);
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(3);
    xOffset += NOISE_DELTA;
    if(location.y<0) location.y=height;
    if(location.y>height) location.y=0;
    if(location.x<0) location.x=width;
    if (location.x>width) location.x=0;
  }

  public void applyForce(PVector f) {
     velocity.add(f); 
  }
  
  boolean isTouching(Food f) {
    return dist(location.y, location.y, f.location.x, f.location.y) < (WIDTH/2 + f.diameter/2);
  }
}
