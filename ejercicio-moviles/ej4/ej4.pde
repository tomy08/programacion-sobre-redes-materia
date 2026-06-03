class Pelota {

  PVector vel = new PVector(1,2);
  PVector acel = new PVector(0,0);
  PVector pos;

  float distancia = 30;
  int diametro = 30;

  int cooldownSeguir = 0; // frames restantes

  Pelota(float x, float y) {
    pos = new PVector(x, y);
  }

  void dibujar() {
    circle(pos.x, pos.y, diametro);
  }

  void mover() {

    if (cooldownSeguir > 0) {
      cooldownSeguir--;
    }

    vel.add(acel);
    vel.limit(2);
    acel.mult(0);
    pos.add(vel);

    if (pos.x > width || pos.x < 0) vel.x *= -1;
    if (pos.y > height || pos.y < 0) vel.y *= -1;
  }

  void seguir(PVector target) {

    // No seguir mientras dure el cooldown
    if (cooldownSeguir > 0) return;

    PVector dir = PVector.sub(pos, target);
    dir.normalize();
    dir.mult(distancia);

    apuntar(PVector.add(target, dir).x,
            PVector.add(target, dir).y);
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

int cant = 7;
Pelota[] pelotas = new Pelota[cant];

void detectarColision(Pelota a, Pelota b){

  if (a == b) return;

  float dist = PVector.dist(a.pos, b.pos);

  // radio real dibujado
  float r1 = a.diametro * 0.5;
  float r2 = b.diametro * 0.5;

  if (dist > r1 + r2) return;

  PVector n = PVector.sub(a.pos, b.pos);
  n.normalize();


  a.pos.add(PVector.mult(n, 2));
  b.pos.sub(PVector.mult(n, 2));

  
  PVector temp = a.vel.copy();
  a.vel = b.vel.copy();
  b.vel = temp;
  
  a.cooldownSeguir = 120;
  b.cooldownSeguir = 120;
}

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

  for (int i = 0; i < cant; i++) {
    pelotas[i].mover();
  }

  for (int i = 0; i < cant; i++) {
    for (int j = i + 1; j < cant; j++) {
      detectarColision(pelotas[i], pelotas[j]);
    }
  }
  fill(200);
  for (int i = 0; i < cant; i++) {
    pelotas[i].dibujar();
    fill(255);
  }
 
}
