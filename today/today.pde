
int[][] points;
int howMany=10;
int spacer = 40;


void setup() {

  size(400, 400);
  frameRate(300);
  colorMode(HSB, 100);
  
  rectMode(CENTER);
  
  points = new int[howMany][howMany];
  
  for(int row=0;row<howMany;row++){
    for(int column=0;column<howMany;column++){
        points[row][column] = 20+(int)(random(spacer));
    }
  }
}

void update() {
  if (frameCount==1000) {
    exit();
  }
 
}

void draw() {
  background(20);
  float progress = ((float)(frameCount))/100;
   for(int row=0;row<howMany;row++){
    for(int column=0;column<howMany;column++){
      fill(points[row][column],100,100);
      rect(
        (spacer*0.5)+(row*spacer),
        (spacer*0.5)+(column*spacer),
        sin(progress+row+column)*points[row][column],
        sin(progress+row+column)*points[row][column]
        );
    }
  }
  
  saveFrame("####.png");
  update();
}
