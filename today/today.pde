
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
  eyeheight = 1000;

  // populate out cubes
  points = new float[pointsCount][3];
  for(int i=0;i<pointsCount;i++){
    float r = random(2*PI); // 
    
    float smallRandom=10+random(20);
    float largeRandom=50+random(100);
    
      points[i][0]=r;
      points[i][1]=random(0.1);
      points[i][2]=50+random(200);
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
  (width/2.0), (height/2.0), eyeheight,
  width/2.0, height/2.0, 0,
  0, 1, 0
  );
   for(int i=0;i<pointsCount;i++){
     pushMatrix();
     strokeWeight(2); // becuase this is random very frame, it makes them "twinkle"
     fill(points[i][0]*2,points[i][0]*2,10+random(20));
   // stroke(points[i][3]*100,points[i][5],50);
    
    translate(
      (width/2)+sin(points[i][0]) * points[i][2],
      (height/2)+cos(points[i][0]) * points[i][2],
      0
      );
        

    box(points[i][0]*3);
    popMatrix();
    points[i][0] = points[i][0] + points[i][1];
  }

  saveFrame("####.png");
  update();
}
