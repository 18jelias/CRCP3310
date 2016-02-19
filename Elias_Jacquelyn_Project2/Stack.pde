class Stack extends Walker{
  int counter; 
  ArrayList<Integer> dataset;
  int size;
  
  Stack(PVector initialLocation) {
    super(initialLocation);
    dataset = new ArrayList();
    counter=0;
    size=80;
    noise_delta=0.04;
  }
  
  void draw() {
    pushStyle();
    stroke(#28CCEA);
    pushMatrix();
     translate(location.x, location.y);
    float theta = 6;
    for (int i = 0; i < 20; i++) {
      line(0, -size/2, 0, size/2);
      rotate(theta);
    }
    popMatrix();
    popStyle();    
  }
  
 void drawState() {
    fill(230);
    textSize(48);
    text("Stack", width/2-60, 60);
    textSize(24);
    text("Elements: " + counter, width/2-60, 90);
    stroke(255);
    if (counter > 12) {
       for(int i = 0; i<12; i++) {
        fill(dataset.get(i));
        ellipse(width/2,200+i*40, 30, 30);
      }
    } else {
      for(int i = 0; i<counter; i++) {
        fill(dataset.get(i));
        ellipse(width/2,200+i*40, 30, 30);
      }
    }
    
  }

  void add(int value) {
    dataset.add(value);
    counter++;
  }

  void delete(int value) {
    if (counter > 0) {
    for (int i = dataset.size()-1; i >= 0; i--) { 
      if (value == dataset.get(dataset.size()-1)) {
        dataset.remove(i);
        counter--;
      } else {
        println("Stack must remove the last inserted object");
      }
    }
    } else {
      println("There are no nodes to remove from the stack.");
    }
  } 

  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size/2 + f.diameter/2);
  }  
}
