class Stack extends Walker{
  int counter; 
  ArrayList<Integer> dataset;
  int size;
  
  Stack(PVector initialLocation) {
    super(initialLocation);
    dataset = new ArrayList();
    counter=0;
    size=40;
    acceleration = new PVector(random(2),random(2));
    velocity = new PVector(random(-2,2), random(-2,2));
  }
  
  void draw() {
    
  }
  
  void walk() {
     acceleration = PVector.fromAngle(noise(xOffset)*TWO_PI);
  }

  void add(int value) {
    
  }

  void delete(int value) {
    for (int i = dataset.size()-1; i >= 0; i--) {
      
      if (value == dataset.get(dataset.size()-1)) {
        dataset.remove(value);
      }
    }
  } 

  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size/2 + f.diameter/2);
  }  
}
