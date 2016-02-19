abstract class Walker implements Touchable, Walkable{

  final int MAX_VELOCITY = 1;
  float noise_delta;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float xOffset;
  int elements;

  
  public Walker(PVector initialLocation) {
    this.location = initialLocation;
    acceleration = new PVector(0,1);
    velocity = new PVector(0,1);
    xOffset = 0.0;
  }
  
  
  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(3);
    if(location.y<0) location.y=height;
    if(location.y>height) location.y=0;
    if(location.x<0) location.x=width;
    if (location.x>width) location.x=0;
     acceleration = PVector.fromAngle(noise(xOffset)*TWO_PI);
     xOffset += noise_delta;
  }

  public void applyForce(PVector f) {
     velocity.add(f); 
  }
 

}
