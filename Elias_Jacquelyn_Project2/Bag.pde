class Bag extends Walker{
  int[] dataset;  
  int counter;
  int capacity;
  int size;

  Bag(PVector initialLocation) {
    super(initialLocation);
    capacity=10;
    counter=0;
    dataset = new int[capacity];
    acceleration = new PVector(random(2),random(2));
    velocity = new PVector(random(-2,2), random(-2,2));    
  }

  void draw() {
  }

  void walk() {
     acceleration = PVector.fromAngle(noise(xOffset)*TWO_PI);
  }  

  void add(int value) {
    if (counter<capacity) {
      for (int i = dataset.length-1; i >= 0; i--) {
        if (value != dataset[i]) {
          dataset[i]=value;
          counter++;
        } else {
          println(value+" is found already in the set.");
        }
      }
    } else {
      println("Data set is full at " + capacity + "nodes.");
    }
  }

  void delete(int value) {
    if (counter>0) {
      for (int i = dataset.length-1; i >= 0; i--) {
        if (value == dataset[i]) {
          dataset[i]=0;
          counter--;
        } else {
          println(value+" is not found in set");
        }
      }
    } else {
      println("There are no nodes to remove");
    }
  }
  
  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size/2 + f.diameter/2);
  }
}

