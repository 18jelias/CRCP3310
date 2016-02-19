class Bag extends Walker {
  ArrayList<Integer> dataset;  
  int counter;
  int capacity;
  int size;

  Bag(PVector initialLocation) {
    super(initialLocation);
    capacity=10;
    counter=0;
    dataset = new ArrayList<Integer>();  
    noise_delta=0.01;
    size=60;
  }

  void draw() {
    pushStyle();
    stroke(#F29069);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    float theta = 9;
    for (int i = 0; i < 20; i++) {
      line(-size, -size/3, size/2, size);
      rotate(theta);
    }
    popMatrix();
    popStyle();
  }

  void drawState() {
    fill(230);
    textSize(48);
    text("Bag", width/2-40, 60);
    textSize(24);
    text("Elements: " + counter, width/2-180, 90);
    text("Capacity: " + capacity, width/2+50, 90);
    pushMatrix();
    translate(width/2, height/2);
    float theta=40;
    stroke(255);
    for (int i = 0; i < counter; i++) {
      fill(dataset.get(i));
      ellipse(-2*size, 0, 30, 30);
      rotate(theta);
    }
    popMatrix();
  }

  void add(int value) {
    if (counter<capacity) {
      boolean inArray=false;
      dataset.add(value);
       counter++;
    } else {
      println("Bag is full at " + capacity + "nodes.");
    }
  }

  void delete(int value) {
    if (counter>0) {
      for (int i = dataset.size()-1; i >= 0; i--) {
        if (value == dataset.get(i)){
          dataset.remove(i);
          counter--;
        } else {
          println(value+" is not found in bag");
        }
      }
    } else {
      println("There are no nodes to remove from the bag");
    }
  }

  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size + f.diameter/2);
  }
}

