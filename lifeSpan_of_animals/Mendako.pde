class Mendako extends Butterfly {

  Mendako(PVector _location, float _lifeSpan, PImage _img) {
    super(_location, _lifeSpan, _img);
  }

  void display() {
    imageMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    tint(int(lifeSpan*255/50));
    image(img, 0, 0, 30, 30);
    popMatrix();
  }
}
