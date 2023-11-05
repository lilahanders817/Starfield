Particle[] first = new Particle[3000];

void setup(){
  size(1500, 700);
  for(int i = 0; i < first.length/2; i++){
    first[i] = new Particle(i*1.2, i/3, Math.random()*2*Math.PI);
  }
  for (int i = 0; i < first.length/2 - 1; i++){
    first[i+first.length/2] = new oddballParticle(8);
 }
  first[first.length-1] = new anotherParticle(360, 120, Math.random()*2*Math.PI);
}

void draw(){
  background(0);
  for (int i = 0; i < first.length; i++) {
    first[i].orbit();
    first[i].show();
  }
}

class Particle{
  double myX, myY, myAngle, myOrbitW, myOrbitH;
  int myColor;

  Particle(double orbitWidth, double orbitHeight, double angle) {
    myOrbitW = orbitWidth;
    myOrbitH = orbitHeight + 11;
    myAngle = angle;
    myColor = 255;
  }
  Particle() {
  }

  void orbit(){
    myAngle += Math.sqrt(Math.pow(myOrbitW, 2) + Math.pow(myOrbitH, 2))/20000;
    myX = width/2 + myOrbitW * Math.cos(myAngle);
    myY = height/2 + myOrbitH * Math.sin(myAngle);
  }

  void show(){
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, 2, 2);
  }
}

class oddballParticle extends Particle{
  double mySpeedX;
  oddballParticle(double speedX) {
    super();
    myX = width / 2;
    myY = height / 1.3;
    mySpeedX = speedX;
  }

  void orbit() {
    if (myX > width) {
      myX = 0; 
    }
    myX += mySpeedX;
  }
  
  void show(){
    //ufo
    fill(100);
    ellipse((float)myX,(float)myY-5,50,20);
    fill(80);
    ellipse((float)myX,(float)myY,90,15);
    fill(0);
    ellipse((float)myX,(float)myY-9,6,6);
    ellipse((float)myX-12,(float)myY-9,6,6);
    ellipse((float)myX+12,(float)myY-9,6,6);
    
  }
}

class anotherParticle extends Particle{
  anotherParticle(double orbitWidth, double orbitHeight, double angle) {
    super(orbitWidth, orbitHeight, angle);
  }
  void show() {
   //planets
   noStroke();
   fill(200, 100, 0); 
   ellipse(-15+(float)myX, -15+(float)myY,20,20);
   fill(0,0,255);
   ellipse(-15+(float)myX, -300+(float)myY, 10, 10);
   fill(50,155,100);
   ellipse(-100+(float)myX, -16+(float)myY, 12, 12);
  }
}
