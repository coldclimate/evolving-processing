
float[][] points;
int pointsCount=250;
int eyeheight;

void setup() {
  size(400, 400, P3D);
  lights();
  background(0);
  blendMode(ADD);
  frameRate(300);
  colorMode(HSB, 100);
  eyeheight = 1400;

  // populate out cubes
  points = new float[pointsCount][6];
  for(int i=0;i<pointsCount;i++){
    float r = random(1);
    float xcircle = sin(r * 2 * PI);
    float ycircle = cos(r * 2 * PI);
    
    float smallRandom=10+random(20);
    float largeRandom=50+random(100);
    
      points[i][0]=(width/2)+(xcircle*largeRandom);
      points[i][1]=(height/2)+(ycircle*largeRandom);
      points[i][2]=-300 + (largeRandom*6);
      points[i][3]=r;
      points[i][4]=smallRandom;
      points[i][5]=largeRandom;
  }
  
}

void update() {
  if(frameCount==1000){exit();}
  eyeheight=eyeheight-2;
  
}

void draw() {
  background(0);

noFill();
//camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)

camera(
  (width/2.0) + (100*sin(8*PI*(frameCount/(float)(1000)))), (height/2.0) + (100*cos(8*PI*(frameCount/(float)(1000)))), eyeheight,
  width/2.0, height/2.0, 0,
  0, 1, 0
  );
   for(int i=0;i<pointsCount;i++){
     pushMatrix();
    strokeWeight(1); // becuase this is random very frame, it makes them "twinkle"
    fill(40,points[i][5],10);
    stroke(points[i][3]*100,points[i][5],50);
    
    translate(
      points[i][0],
      points[i][1],
      points[i][2]
      );

    box(points[i][4]);
    popMatrix();
     
  }

  saveFrame("####.png");
  update();
}
