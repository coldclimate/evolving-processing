//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png


// Do anything you like below here
float majorDiameter = 100;
float minorDiameter = 50;
float ticker = 0;

// set to true to not save images whilst working
Boolean DEBUG = false;



void drawMethod(){
  
  noFill();
 // stroke(90,80);
  stroke(100*sin(ticker*4),10, 255, 20);
  
  ellipse(
    (WIDTH/2) + (sin(ticker)*majorDiameter) + (sin(ticker*8)*majorDiameter*0.75), 
    (HEIGHT/2) + (cos(ticker)*majorDiameter) + (cos(ticker*8)*majorDiameter*0.75), 
    minorDiameter * sin(ticker), 
    minorDiameter * sin(ticker)
    );
   
  // do one complete rotation every run
  ticker += (TWO_PI/FRAMELIMIT);
 
  
}



// until here - no cheating, everything below this line is sacrosanct

//some constants to make maths easier
int FRAMELIMIT = 1024;
int WIDTH = 800;
int HEIGHT = 600;


int frameCount = 0;

void setup() {
// ironically you can't use variables in size, so these are duplicated
  size(800, 600);
  background(255, 255, 255);
}


void draw() {
  frameCount++;
  if (!DEBUG){
    saveFrame(year()+"_"+month()+"_"+day()+"_####.png");
  }
  if (frameCount == FRAMELIMIT) {
    exit();
  }
  drawMethod();
}
