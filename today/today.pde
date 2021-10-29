
float[][] points;
int pointsCount=400;
int eyeheight;
int spacer;

void setup() {
  size(400, 400, P3D);
  lights();
  background(0);
  blendMode(ADD);
  frameRate(300);
  colorMode(HSB, 100);
  spacer = 10;
  strokeWeight(3); // becuase this is random very frame, it makes them "twinkle"
  eyeheight = 50;

  // populate out cubes
  points = new float[pointsCount*pointsCount][3];
  for(int i=0;i<pointsCount;i++){

    float smallRandom=10+random(20);
    float largeRandom=5+random(45);
    
      points[i][0]=random(2*PI); // location on the main ring
      points[i][1]=random(2*PI); // location on the subring
      points[i][2]=20+random(20); // major ring width
  }
  
}

void update() {
  if(frameCount==1000){exit();}
 // eyeheight=eyeheight-4;
  if(eyeheight <-1000){eyeheight=-1000;}
}

void draw() {
  background(0);
  float progress = ((float)(frameCount))/1000;
//  println(progress);

noFill();
//camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)

camera(
  (width/2.0) + (200*sin(2*PI*progress)), eyeheight, (height/2) + (200*cos(2*PI*progress)),
  width/2.0, height/2.0, 0,
  0, 1, 0
  );
  
  int offSet = (spacer*(pointsCount/20))/2;
   for(int i=0;i<pointsCount;i++){
     
     int row = i/20;
     int column = i % 20;
     
         stroke(5, 100,50+(50*progress));
         //fill(cos(points[i][1])*100, second,100);
         //fill(cos(points[i][1])*100, 20,100);
 
         pushMatrix();
         translate(
          ((width/2)-offSet)+(row*10),
          ((height/2)-offSet)+(column*10),
          (10*sin(column+row+(10*progress)))
          );
          
          //rotateY(row+ (progress*10));
          
          box(5);
         popMatrix();
        
          points[i][0]+=0.01;
          points[i][1]+=0.1;
      
   }
     

  saveFrame("####.png");
  update();
}
