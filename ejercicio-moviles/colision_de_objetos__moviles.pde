Movil[] moviles;
int cantidad = 20;

void setup() {
  size(800, 600);

  moviles = new Movil[cantidad];

  for (int i = 0; i < moviles.length; i++) {
    moviles[i] = new Movil(random(width), random(height));
  }
}

void draw() {
  background(240);

  for (int i = 0; i < moviles.length; i++) {
    for (int j = i + 1; j < moviles.length; j++) {
      if (moviles[i].chocaCon(moviles[j])) {
        moviles[i].alejar(moviles[j].posicion);
        moviles[j].alejar(moviles[i].posicion);
      }
    }
  }

  for (int i = 0; i < moviles.length; i++) {
    moviles[i].actualizar();
    moviles[i].mostrar();
  }
}

class Movil {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;

  float radio = 15;
  float fuerza = 0.2;
  float velocidadMax = 5;

  Movil(float x, float y) {
    posicion = new PVector(x, y);
    velocidad = PVector.random2D();
    aceleracion = new PVector();
  }

  void actualizar() {
    velocidad.add(aceleracion);
    velocidad.limit(velocidadMax);
    posicion.add(velocidad);
    aceleracion.mult(0);

    if (posicion.x < 0 || posicion.x > width) {
      velocidad.x *= -1;
    }
    if (posicion.y < 0 || posicion.y > height) {
      velocidad.y *= -1;
    }
  }

  void mostrar() {
    fill(100, 150, 255);
    noStroke();
    ellipse(posicion.x, posicion.y, radio * 2, radio * 2);
  }

  void alejar(PVector objetivo) {
    PVector direccion = PVector.sub(posicion, objetivo);
    direccion.normalize();
    direccion.mult(fuerza);
    aceleracion.add(direccion);
  }

  boolean chocaCon(Movil otro) {
    float distancia = PVector.dist(posicion, otro.posicion);
    return distancia < (radio + otro.radio);
  }
}
