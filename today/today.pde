//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png


// Do anything you like below here
float circleWidth = 10;



// set to true to not save images whilst working
Boolean DEBUG = false;



void drawMethod(){
  noFill();
  blendMode(ADD);
  float randA = random(1);
  float randB = random(1);
 

 
  int increments = 10;
 
 
 
 
 
  float majorRadius = random(400);
  
  
   for(float p=0;p<1;p=p+0.1){
      color from = color(0, 50, 100,40);
      color to = color(255, 100, 100,10);
  /*  if (random(10) > 9){
        from = color(255, 100, 255,40);
       to = color(255, 255, 100,10);
       print("pop");
    }
    */
   float rando = -0.5+random(1);
   float finalX =  (WIDTH/2)+(sin(rando*PI)*majorRadius*p);
   float finalY = (HEIGHT/2)-(cos(rando*PI)*majorRadius*p);
   float xIncrement = ((WIDTH/2) - finalX ) /increments;
   float yIncrement = ((HEIGHT/2) - finalY ) /increments;
  
   int j=0;
   for (float i=0; i<10; i=i+1){
     color interA = lerpColor(from, to, (i/increments));
     stroke(interA);
     j=j+1; 
   line(
   (WIDTH/2) + (xIncrement*(j-1)) ,
   (HEIGHT) - (yIncrement*(j-1)),
   (WIDTH/2)+ (xIncrement*j),
   (HEIGHT) - (yIncrement*j) 
   );
   }
 /*  fill(255,255,0,50);
   ellipse(
   (WIDTH/2)+ (xIncrement*increments),
   (HEIGHT) - (yIncrement*increments),
   3,
   3);
   */
   }
 
 
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
  background(0,0,0);
}


void draw() {
  frameCount++;
  if (!DEBUG){
    saveFrame("####.png");
  }
  if (frameCount == FRAMELIMIT) {
    exit();
  }
  drawMethod();
}
