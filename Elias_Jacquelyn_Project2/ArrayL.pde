class ArrayL extends Walker {
  ArrayList<Integer> dataset;
  int count;
  int size;

  ArrayL(PVector initialLocation) {
    super(initialLocation);
    dataset = new ArrayList();
    count = 1;
    size=40;
    acceleration = new PVector(random(-3,3),random(-3,3));
    velocity = new PVector(0,1);
    noise_delta=0.02;
  }

  void draw() {
    pushStyle();
    rect(location.x, location.y, size, size);
    popStyle();
  }
  
  void walk() {

  }

  void add(int value) {
    for (int i = dataset.size()-1; i >= 0; i--) {

      if (value == dataset.get(i)) {
        dataset.add(value);
        count++;
      }
    }
  }

  void delete(int value) {
    for (int i = dataset.size()-1; i >= 0; i--) {
      if (value == dataset.get(i)) {
        dataset.remove(i);
        count--;
      }
    }
  }
  
  boolean isTouching(Node f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (size/2 + f.diameter/2);
  }
}

