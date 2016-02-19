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

  for (Touchable w : walkers) {
    w.draw();
    w.walk();
    w.update();
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
  for (int i = 1; i < 4; i+=areaWidth) {
    stroke(255);
    line(i*areaWidth, 0, i*areaWidth, height);
  }  
  popStyle();  
}




