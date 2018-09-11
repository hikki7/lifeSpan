class Butterfly{
  PVector location;
  PVector velocity;
  float lifeSpan;
  float mass=1;
  PImage img;
  
  Butterfly(PVector _location,float _lifeSpan,PImage _img){
    location=_location.get();
    lifeSpan=_lifeSpan;
    velocity=new PVector();
    img=_img;
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
     velocity=new PVector(mouseX-location.x,mouseY-location.y); 
     velocity.normalize();
     velocity.mult(10);
     location.add(velocity);
     lifeSpan-=1;
  }
  
  void display(){
    imageMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    tint(int(lifeSpan*255/40));
    image(img,0,0,30,20);
    popMatrix();
  }
  
  boolean isDead() {
    if (lifeSpan<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
