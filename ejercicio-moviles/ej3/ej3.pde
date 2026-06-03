class Pelota {

 
  PVector vel = new PVector(1,2);
  PVector acel = new PVector(0,0);
  PVector pos;
  float distancia = 40; // Modificar a gusto

  Pelota(float x, float y) {
    pos = new PVector(x, y);
  }

  void dibujar() {
    circle(pos.x, pos.y, 30);
  }

  void mover() {
    vel.add(acel);
    vel.limit(1); // Modificar a gusto
    acel.mult(0);
    pos.add(vel);

    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }

    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void seguir(PVector target) {

    PVector dir = PVector.sub(pos, target);
    dir.normalize();
    dir.mult(distancia);

    apuntar(PVector.add(target, dir).x,PVector.add(target, dir).y);
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

int cant = 5;
Pelota[] pelotas = new Pelota[cant];

void setup() {
  size(500, 500);

  for (int i = 0; i < cant; i++) {
    pelotas[i] = new Pelota(random(width), random(height));
  }
}

void draw() {
  background(100);


  for (int i = 1; i < cant; i++) {
    pelotas[i].seguir(pelotas[i - 1].pos);
  }

  // dibujar todo
  for (int i = 0; i < cant; i++) {
    pelotas[i].mover();
    pelotas[i].dibujar();
  }
}
