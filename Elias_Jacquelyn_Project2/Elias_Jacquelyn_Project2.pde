import controlP5.*;


//Jacquelyn Elias
//Project 2
//Displays different data structures that add and delete as they hit 


final int VIEW_STORY = 0;
final int VIEW_STATE = 1;
int view = VIEW_STORY;
int areaWidth;
int numOfNodes;

ControlP5 cp5;
Walker[] walkers;
ArrayList<Node> addNodes;
ArrayList<Node> deleteNodes;
Button story;
Button state;
Slider slider;
NumLine[] lines;

void setup() {
  size(1200, 800);
  numOfNodes=30;
  initializeSlider();
  initializeArrays();
  story = new Button(1100, 50, "Story Mode");
  state = new Button(1100, 50, "State Mode");
  areaWidth = 300;
  lines=new NumLine[30];
  for (int i = 0; i<lines.length;i++) {
    lines[i]=new NumLine(i*40);
  }

}

//Draws functions depending on which view is being shown
void draw() {
  background(0);
  if (view == VIEW_STORY) {
    drawStoryView();
  } else if (view == VIEW_STATE) {
    drawStateView();
  } else {
    println("Error");
  }
}

void mousePressed() {
  if (story.isClicked() && view==VIEW_STATE) {
    view = VIEW_STORY;
  } else if (state.isClicked() && view==VIEW_STORY) {
    view = VIEW_STATE;
  }
}

//Draws numbers in background
void drawBackground() {
  for(NumLine n:lines) n.draw();
}

//Initializes different Node and Walker arrays
void initializeArrays() {
  initializeWalker();
  initializeAddNodes();
  initializeDeleteNodes();
}

void initializeWalker() {
  walkers = new Walker[4];
  PVector temp = new PVector(random(width), random(height));
  walkers[0] = new ArrayL(temp);
  temp = new PVector(random(width), random(height));
  walkers[1]=new Bag(temp);
  temp = new PVector(random(width), random(height));
  walkers[2] = new Set(temp);
  temp = new PVector(random(width), random(height));
  walkers[3] = new Stack(temp);
}

void initializeAddNodes() {
  addNodes = new ArrayList<Node>();
  for (int i = 0; i<numOfNodes; i++) {
    addNodes.add(new Node("add"));
  }
}

void initializeDeleteNodes() {
  deleteNodes = new ArrayList<Node>();
  for (int i = 0; i<numOfNodes; i++) {
    deleteNodes.add(new Node("delete"));
  }
}





