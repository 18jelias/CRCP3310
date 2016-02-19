abstract class Walker implements Touchable, Walkable{

  float noise_delta;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float xOffset;
  int elements;

  
  public Walker(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 1);
    acceleration = new PVector(1,0);
    xOffset = 0.0;
  }
  
  
  public void walk() {
    acceleration = PVector.fromAngle(noise(xOffset)*TWO_PI);
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(3);
    xOffset += noise_delta;
    if(location.y<0) location.y=height;
    if(location.y>height) location.y=0;
    if(location.x<0) location.x=width;
    if (location.x>width) location.x=0;
  }
 

}
