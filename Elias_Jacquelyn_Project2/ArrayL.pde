class ArrayL extends Walker {
  ArrayList<Integer> dataset;
  int count;
  int size;

  ArrayL(PVector initialLocation) {
    super(initialLocation);
    dataset = new ArrayList();
    count = 0;
    size=70;
    noise_delta=0.08;
  }
  
  //draws on story mode
  void draw() {
    pushStyle();
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    fill(#C472DE);
    rectMode(CENTER);
    rect(0, 0, size, size);
    popMatrix();
    popStyle();
  }

  //draws on state mode
  void drawState() {
    fill(230);
    textSize(48);
    text("Array List", width/2-100, 60);
    textSize(24);
    text("Elements: " + count, width/2-60, 90);
    stroke(255);
    if (count > 12) {
       for(int i = 0; i<12; i++) {
        fill(dataset.get(i)*.25);
        ellipse(width/2,200+i*40, 30, 30);
      }
    } else {
      for(int i = 0; i<count; i++) {
        fill(dataset.get(i));
        ellipse(width/2,200+i*40, 30, 30);
      }
    }
  }

  //adds and deletes as nodes are touched
  void add(int value) {
    dataset.add(value);
    count++;
  }

  void delete(int value) {
    if (count > 0) {
      for (int i = dataset.size ()-1; i >= 0; i--) {
        if (value == dataset.get(i)) {
          dataset.remove(i);
          count--;
        } else {
          println("Arraylist does not contain this value to remove");
        }
      }
    } else {
      println("There are no nodes to remove from the array list");
    }
  }

  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size/2 + f.diameter/2);
  }
}

