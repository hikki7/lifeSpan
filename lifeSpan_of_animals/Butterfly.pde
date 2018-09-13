class Butterfly {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  float mass=1;
  PImage bfimg;
  PVector noise;
  float ynoise=0;

  Butterfly(PVector _location, float _lifeSpan) {
    location=_location.get();
    lifeSpan=_lifeSpan;
    velocity=new PVector();
    acceleration=new PVector(0, 0);
    bfimg=loadImage("butterfly.png");
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity=new PVector(mouseX-location.x, mouseY-location.y); 
    velocity.normalize();
    velocity.mult(5);
    velocity.add(acceleration);
    noise=new PVector(0,map(noise(ynoise),0,1,-7,7));
    velocity.add(noise);
    location.add(velocity);
    acceleration.mult(0);
    lifeSpan-=0.05;
    ynoise+=0.01;
  }

  void display() {
    imageMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    tint(int(lifeSpan*255/40));
    image(bfimg, 0, 0, 60, 40);
    popMatrix();
  }

  boolean isDead() {
    if (lifeSpan<0.0) {
      return true;
    } else {
      return false;
    }
  }

  void applyForce(PVector _force) {
    PVector force=_force.get();
    force.div(mass);
    acceleration.add(force);
  }
}
