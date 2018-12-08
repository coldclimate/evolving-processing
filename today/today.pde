//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png


// set to true to not save images whilst working
Boolean DEBUG = false;
  
int howMany = 100;
float maxSize = 40;
float[][] points = new float[howMany][4];





void drawMethod() {
  //background(0);
  blendMode(ADD);
  

  if(frameCount < 2){
    for(int i=0; i<howMany;i++){
         points[i][0] = random(1)*WIDTH;
         points[i][1] = random(1)*HEIGHT;
         points[i][2] = random(1)*maxSize; // size
         points[i][3] = random(2);
    }
  

  }
  
  for(int i=0; i<howMany;i++){
      if(points[i][3] > 1){ 
        fill(0,100,255,20);
      }else{
        fill(255,105,180,20);
      }
      
     rect(
       points[i][0],
       points[i][1],
       points[i][2],
       points[i][2]
     );
    
     points[i][0] = (points[i][0] + (0.5 * points[i][2]) ) % WIDTH;
     points[i][2] = points[i][2] -1 ;

     if(points[i][2] == 0){
      points[i][2] = random(maxSize);
     }
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
  background(0, 0, 0);
}


void draw() {
  frameCount++;
  if (!DEBUG) {
    saveFrame("####.png");
  }
  if (frameCount == FRAMELIMIT) {
    exit();
  }
  drawMethod();
}
