void drawStoryView() {
  slider.setVisible(false);
  drawBackground();
  drawStoryBackground();
  runStory();
  for(Node n: addNodes) {
    n.draw(); 
  }
  for(Node n: deleteNodes) n.draw();
  state.draw();
}

void runStory() {
  for (Walkable w : walkers) w.walk();
  for (Touchable w : walkers) {
    w.draw();
    for (int i=(addNodes.size()-1); i>=0;i--) {
      if (w.isTouching(addNodes.get(i))) {
        w.add(addNodes.get(i).isTouched());
        addNodes.remove(i);
        addNodes.add(new Node("add"));
      }
    }
    for (int i=deleteNodes.size()-1; i>=0;i--) {
      
      if (w.isTouching(deleteNodes.get(i))) {
        w.delete(deleteNodes.get(i).isTouched());
        deleteNodes.remove(i);
        deleteNodes.add(new Node("delete"));
      }
    }
  }
}

void drawStoryBackground() {
  pushStyle();
  fill(255);
  textSize(24);
  for (int i = 1; i < 4; i++) {
    stroke(255);
    line(i*300, 0, i*300, height);
  }  
  text("Add", 130, 750);
  text("Delete", 430, 750);
  text("Add", 730, 750);
  text("Delete", 1000, 750);
  popStyle();  
}




