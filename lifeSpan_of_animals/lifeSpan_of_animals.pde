ArrayList<Wave> wv=new ArrayList<Wave>();
ArrayList<Molfo> ml=new ArrayList<Molfo>();
ArrayList<Monshiro> ms=new ArrayList<Monshiro>();
ArrayList<Asagimadara>as=new ArrayList<Asagimadara>();
ArrayList<Oomurasaki>oo=new ArrayList<Oomurasaki>();
ArrayList<Ageha>ag=new ArrayList<Ageha>();

float mlSpan=30;
float msSpan=15;
float asSpan=120;
float ooSpan=60;
float agSpan=14;

PVector targetLoc;
PVector []body=new PVector[17];


void setup() {

  //fullScreen(P2D);
  size(1200, 1200, P2D);
  background(21);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  frameRate(30);
}

void draw() {

  background(21);
  fill(0, 100, 100);
  noStroke();
  ellipse(mouseX, mouseY, 30, 30);

  //ganerate wave
  for (int i=wv.size()-1; i>0; i--) {
    Wave w=wv.get(i); 
    w.run();
    if (w.isDead()) {
      wv.remove(i);
    }
  }

  //モルフォチョウ
  for (int i=ml.size()-1; i>0; i--) {
    Molfo m=ml.get(i);
    m.update(new PVector(mouseX, mouseY));
    m.display();
    if (m.lifeSpan<0.0) {
      ml.remove(i);
    }
  }

  //モンシロチョウ
  for (int i=ms.size()-1; i>0; i--) {
    Monshiro m=ms.get(i);
    m.update(new PVector(mouseX, mouseY));
    m.display();
    if (m.lifeSpan<0.0) {
      ms.remove(i);
    }
  }

  //アサギマダラ
  for (int i=as.size()-1; i>0; i--) {
    Asagimadara a=as.get(i);
    a.update(new PVector(mouseX, mouseY));
    a.display();
    if (a.lifeSpan<0.0) {
      ms.remove(i);
    }
  }

  //オオムラサキ
  for (int i=oo.size()-1; i>0; i--) {
    Oomurasaki o=oo.get(i);
    o.update(new PVector(mouseX, mouseY));
    o.display();
    if (o.lifeSpan<0.0) {
      oo.remove(i);
    }
  }

  //アゲハ
  for (int i=ag.size()-1; i>0; i--) {
    Ageha a=ag.get(i);
    a.update(new PVector(mouseX, mouseY));
    a.display();
    if (a.lifeSpan<0.0) {
      ag.remove(i);
    }
  }
}


void keyPressed() {

  if (key=='a'||key=='A') {
    PVector location=new PVector(random(width), random(height));
    ml.add(new Molfo(location, mlSpan, radians(random(-45, 45))));
    wv.add(new Wave(location));

    for (int i=0; i<ms.size(); i++) {
      ms.remove(i);
    }
    for (int i=0; i<as.size(); i++) {
      as.remove(i);
    }
    for (int i=0; i<oo.size(); i++) {
      oo.remove(i);
    }
    for (int i=0; i<ag.size(); i++) {
      ag.remove(i);
    }
  }
  if (key=='s'||key=='S') {
    PVector location=new PVector(random(width), random(height));
    ms.add(new Monshiro(location, msSpan, radians(random(-45, 45))));
    wv.add(new Wave(location));

    for (int i=0; i<as.size(); i++) {
      as.remove(i);
    }
    for (int i=0; i<ml.size(); i++) {
      ml.remove(i);
    }
    for (int i=0; i<oo.size(); i++) {
      oo.remove(i);
    }
    for (int i=0; i<ag.size(); i++) {
      ag.remove(i);
    }
  }
  if (key=='d'||key=='D') {
    PVector location=new PVector(random(width), random(height));
    as.add(new Asagimadara(location, asSpan, radians(random(-45, 45))));
    wv.add(new Wave(location));

    for (int i=0; i<ms.size(); i++) {
      ms.remove(i);
    }
    for (int i=0; i<ml.size(); i++) {
      ml.remove(i);
    }
    for (int i=0; i<oo.size(); i++) {
      oo.remove(i);
    }
    for (int i=0; i<ag.size(); i++) {
      ag.remove(i);
    }
  }
  if (key=='f'||key=='F') {
    PVector location=new PVector(random(width), random(height));
    oo.add(new Oomurasaki(location, ooSpan, radians(random(-45, 45))));
    wv.add(new Wave(location));

    for (int i=0; i<ms.size(); i++) {
      ms.remove(i);
    }
    for (int i=0; i<as.size(); i++) {
      as.remove(i);
    }
    for (int i=0; i<ml.size(); i++) {
      ml.remove(i);
    }
    for (int i=0; i<ag.size(); i++) {
      ag.remove(i);
    }
  }
  if (key=='g'||key=='G') {
    PVector location=new PVector(random(width), random(height));
    ag.add(new Ageha(location, agSpan, radians(random(-45, 45))));
    wv.add(new Wave(location));

    for (int i=0; i<ms.size(); i++) {
      ms.remove(i);
    }
    for (int i=0; i<as.size(); i++) {
      as.remove(i);
    }
    for (int i=0; i<ml.size(); i++) {
      ml.remove(i);
    }
    for (int i=0; i<oo.size(); i++) {
      oo.remove(i);
    }
  }
}
