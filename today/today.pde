
float[][] points;
int pointsCount=200;
int eyeheight;

void setup() {
  size(400, 400, P3D);
  lights();
  background(0);
  blendMode(ADD);
  frameRate(300);
  colorMode(HSB, 100);
  strokeWeight(2); // becuase this is random very frame, it makes them "twinkle"
  eyeheight = 1000;

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
  eyeheight=eyeheight-2;
}

void draw() {
  background(0);

noFill();
//camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)

camera(
  (width/2.0), (height), eyeheight,
  width/2.0, height/2.0, 0,
  0, 1, 0
  );
  
   for(int i=0;i<pointsCount;i++){
         fill(cos(points[i][1])*80,100,100);
         pushMatrix();
         translate(
          (width/2)+
            sin(points[i][0])*200+
            sin(points[i][1])*80,
          (height/2)+
            cos(points[i][0])*200+
            cos(points[i][1])*80,
          cos(points[i][1])*80);
          sphere(points[i][2]);
         popMatrix();
        
         // points[i][0]+=0.01;
          points[i][1]+=0.01;
      
   }
     

  saveFrame("####.png");
  update();
}
