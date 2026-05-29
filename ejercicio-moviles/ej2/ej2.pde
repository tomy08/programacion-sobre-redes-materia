class Pelota {
  PVector vel = new PVector(1,2);
  PVector acel = new PVector(0,0);
  PVector pos;

  Pelota(float x, float y) {
    pos = new PVector(x,y);
  }

  void dibujar() {
    circle(pos.x,pos.y,30);
  }

  void mover() {
    vel.add(acel);
    acel.mult(0);
    vel.limit(5);
    pos.add(vel);

    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }

    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void apuntar(float dx, float dy) {
    PVector b = new PVector(dx,dy);
    PVector r = b.copy();
    r.sub(pos);
    r.normalize();
    r.mult(0.2);
  }

  void acercar(PVector otro) {
    PVector dir = otro.copy();
    dir.sub(pos);
    dir.normalize();
    dir.mult(0.1);

  }
}

Pelota p1, p2;

PVector rot = new PVector(1,1);

void setup() {
  size(500,500);

  p1 = new Pelota(width/2,height/2);
  p2 = new Pelota(width/3,height/3);
}

void draw() {
  background(100);

  rot.rotate(PI/180);

  p2.acercar(p1.pos);
  p1.mover();
  p2.mover();

  fill(255,0,0);
  p1.dibujar();

  fill(0,150,255);
  p2.dibujar();
}
