class Set extends Walker{
  ArrayList<Integer> dataset;
  int capacity;
  int counter;
  int size;

  Set(PVector initialLocation) {
    super(initialLocation);
    capacity=10;
    counter=0;
    dataset = new ArrayList<Integer>();
    size=60;
    noise_delta=0.3;
  }

  void draw() {
    pushStyle();
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    float theta = 40;
    for (int i = 0; i < 12; i++) {
      fill(#83DE72);
      ellipse(0, -size/2, size/4, size/4);
      fill(255);
      ellipse(0,0,size/2,size/2);
      rotate(theta);
    }
    popMatrix();
    popStyle();
  }
  
  void drawState() {
    fill(230);
    textSize(48);
    text("Set", width/2-40, 60);
    textSize(24);
    text("Elements: " + counter, width/2-180, 90);
    text("Capacity: " + capacity, width/2+50, 90);
    pushMatrix();
    translate(width/2, height/2);
    float theta=36;
    stroke(255);
    for (int i = 0; i < counter; i++) {
      fill(dataset.get(i));
      ellipse(-4*size, 0, 30, 30);
      rotate(theta);
    }
    popMatrix();    
    
  }

  void add(int value) {
    if (counter<capacity) {
      if(!dataset.contains(value)) {
        dataset.add(value);
        counter++;
      } else {
          println(value+" is found already in the set.");
      }
    } else {
      println("Data set is full at " + capacity + "nodes.");
    }

  }

  void delete(int value) {
    if (counter>0) {
      for (int i = dataset.size()-1; i >= 0; i--) {
        if (value == dataset.get(i)) {
          dataset.remove(i);
          counter--;
        } else {
          println(value+" is not found in set");
        }
      }
    } else {
      println("There are no nodes to remove from set");
    }
  }

  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size/2 + f.diameter/2);
  }  
}
