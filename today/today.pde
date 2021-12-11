
float[][] points;
int howMany=200;
int spacer = 80;
float wind = 0;

float rowOneStep = 10;
float rowTwoStep = 60;

float[] branchRandoms;

// fat 2d arrays that act as bitmaps for the "sprite"
float[][] spaceOpen = {
  {0,0,1,0,0,1,0,0},
  {0,0,1,0,0,1,0,0},
  {0,1,1,1,1,1,1,0},
  {1,1,0,1,1,0,1,1},
  {1,1,1,1,1,1,1,1},
  {0,0,1,1,1,1,0,0},
  {0,0,1,0,0,1,0,0},
  {0,1,0,0,0,0,1,0}
};
  
 float[][] spaceClosed ={
  {0,1,0,0,0,0,1,0},
  {0,0,1,0,0,1,0,0},
  {0,1,1,1,1,1,1,0},
  {1,1,0,1,1,0,1,1},
  {1,1,1,1,1,1,1,1},
  {0,0,1,1,1,1,0,0},
  {0,0,1,0,0,1,0,0},
  {0,0,0,1,1,0,0,0}
};

PImage moon;


void setup() {
  background(0);
 // blendMode(ADD);
 
 moon = loadImage("moon.PNG");

  size(400, 400);
  frameRate(200);
  colorMode(RGB, 100);
  
  rectMode(CENTER);
  
  points = new float[howMany][3];
  
  for(int row=0;row<howMany;row++){
    points[row][0] = random(400);
    points[row][1] = random(400);
    points[row][2] = random(PI);
  }
  
  // you can't use random each loop of the trees move
  // in a non-tree way
  
  branchRandoms =new float[20];
  for(int row=0;row<20;row++){
    branchRandoms[row] = random(10);
  }
  
}

void update() {
  if (frameCount==1000) {
    exit();
  }
 
}

void drawSpaceInvader(float x, float y,boolean closed){
  noStroke();
  
  // loop though the bitmaps, rendering a square if it's a 1
  // ugly duplicate code because it's late and I'm tired.  The boolean flips between maps
  if(closed){
    for(int row=0;row<8;row++){
      for(int column=0;column<8;column++){
        
        if(spaceClosed[column][row] == 1){
          fill(10,100,10);
          rect(
          x+(5*row),
          y+(5*column),
          5,
          5);
        }
        
       }
    }
  
  }else{
        for(int row=0;row<8;row++){
      for(int column=0;column<8;column++){
        
        if(spaceOpen[column][row] == 1){
          fill(10,100,10);
          rect(
          x+(5*row),
          y+(5*column),
          5,
          5);
        }
        
       }
    }
  }
  
}

void drawPenguin(float x, float y){
 // draw penguin
  strokeWeight(1);
  //black body
  fill(0);
  stroke(0);
  ellipse(x, y, 50, 50);
  
  //white belly
  fill(100);
  stroke(100);
  ellipse(x, y+10, 30, 30);
  
  //eyes
  ellipse(x+10, y-10, 10, 10);
  ellipse(x-10, y-10, 10, 10);
  
  //pupils
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(x+10, y-10, 5, 5);
  ellipse(x-10, y-10, 5, 5);
  
  //feets and nose!
  fill(100,80,0);
  stroke(100,80,0);
  ellipse(x+10, y+30, 5, 5);
  ellipse(x-10, y+30, 5, 5);
  ellipse(x, y-5, 5, 5);
}


void drawTree(float x, float y, float size,float cycle){
  // trunk
  fill(27,18,5);
  stroke(27,18,5);
  rect(x,y+(3*size),size*0.3,2*size);
  // tree
  strokeWeight(3);
  for(int branch=0;branch<200;branch++){ 
    stroke(0,40+(branch % 19),0,20+((branch+2) % 19));
    line(  x-(branch % 100)-branchRandoms[branch % 19],
          y+(branch % 100)+branchRandoms[(branch+1) % 19],
          x+(branch % 100)+branchRandoms[branch % 19],
          y+(branch % 100)+branchRandoms[(branch+2) % 19] );
  }
}

void drawMoon(float progress){
  progress = progress/10;
  
image(moon, 200 + (200*sin(progress/2)), 200 - (200*sin(progress/2)), 100, 100);
     
}

void drawSnow(float bindex, float tindex, float progress){
  wind = sin(progress);
   for(int row=0;row<howMany;row++){
      stroke(100,100,100);
      noFill();
      strokeWeight(points[row][2]*3);
      
      // only draw the small snow
      if (points[row][2] >bindex && points[row][2] <tindex) {
      point(points[row][0], points[row][1]);
      }
      
      points[row][0] = (points[row][0]+(wind * points[row][2])) % width;
      if (points[row][0]<0){points[row][0]=width;}
      points[row][1] = (points[row][1]+points[row][2]) % height;
  }
  
}

void draw() {
  
  float progress = ((float)(frameCount))/100;
    background(0+progress);
  
  // moonah
  
  drawMoon(progress);
  
  // background snow
  drawSnow(0, 1.5, progress);
  
  // ground snow
  fill(100,100,100);
  stroke(100,100,100);  
  rect(200,400,400,50);
  
  //draw the trees
  drawTree(100,250,30,progress);
  drawTree(50,200,30,progress);
  drawTree(150,250,30,progress);
  drawTree(200,200,30,progress);
  drawTree(250,250,30,progress);
  drawTree(300,250,30,progress);
  drawTree(350,200,30,progress);
  drawTree(400,250,30,progress);
  
    // draw the penguin
  drawPenguin(200+(wind*200),350);
  
  // foreground snow
  drawSnow(1.5, 5, progress);
  
  //draw spaceInvaders

  // this is naff because they don't step down at the end of the row
  // but it's cheap and cheap
    rowOneStep = 10 + abs(5*progress);
  
    rowTwoStep = 60 + abs(5*progress);

// 3rd input is true or fast, flipping the bitmaps
  for(int vaders=0;vaders<4;vaders++){
    drawSpaceInvader(width*0.5 + cos(progress)*width*0.5 + vaders*50, rowOneStep ,((progress*100) % 2) == 1);
  }

  for(int vaders=0;vaders<4;vaders++){
    drawSpaceInvader(width*0.5 + sin(progress)*width*0.5 + vaders*50, rowTwoStep ,((progress*100) % 2) == 1);
  }
    
  saveFrame("####.png");
  update();
}
