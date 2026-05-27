class Pelota {
  PVector vel = new PVector(1,1);
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
    pos.add(vel);

    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }

    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void addFuerza(PVector f) {
    acel.add(f);
  }

  void apuntar(float dx, float dy) {
    PVector b = new PVector(dx,dy);

    PVector r = b.copy();
    r.sub(pos);

    r.normalize();
    r.mult(0.2);

    addFuerza(r);
  }

}

Pelota p1;
PVector rot = new PVector(1,1);

void setup() {
  size(500,500);
  p1 = new Pelota(width/2,height/2);

}

void draw() {
  background(100);
  rot.rotate(PI/180);
  p1.addFuerza(rot);
  p1.mover();
  p1.dibujar();
}
