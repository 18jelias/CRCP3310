int stateWidth = width / 4;

//draws all parts of state view
void drawStateView() {
  drawBackground();
  story.draw();
  slider.setVisible(true);
  runState();
}

//does actions in state mode
void runState() {
  if(slider.getValue()==0) drawArrayL();
  else if(slider.getValue()==1) drawBag();
  else if(slider.getValue()==2) drawSet();
  else if(slider.getValue()==3) drawStack();
}

void drawArrayL() {
  walkers[0].drawState();
}

void drawBag() {
  walkers[1].drawState();
}

void drawSet() {
  walkers[2].drawState();
}

void drawStack() {
  walkers[3].drawState();
}

//adds value to slider
void initializeSlider() {
  cp5 = new ControlP5(this);
  slider = new Slider(cp5, "Choose data structure");
  slider.setPosition(width/2-100, height-100)
           .setWidth(200)
           .setHeight(50)
           .setRange(0, 3) // values can range from big to small as well
           .setValue(0)
           .setColorTickMark(255)
           .setNumberOfTickMarks(4)
           .setSliderMode(Slider.FLEXIBLE)
           .setVisible(false)
           ;  
}
