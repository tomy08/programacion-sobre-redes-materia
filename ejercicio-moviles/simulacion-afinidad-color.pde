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

      float diferencia = abs(moviles[i].c - moviles[j].c);

      if (diferencia < 50) {
        float multiplicador = map(diferencia, 0, 50, 0.05, 0);

        moviles[i].acercar(moviles[j].posicion, multiplicador);
        moviles[j].acercar(moviles[i].posicion, multiplicador);
      }

      if (moviles[i].chocaCon(moviles[j])) {
        moviles[i].resolverColision(moviles[j]);
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

  float radio = 10;
  float velocidadMax = 4;
  float c;

  Movil(float x, float y) {
    posicion = new PVector(x, y);
    velocidad = PVector.random2D();
    aceleracion = new PVector();
    c = random(255);
  }

  void actualizar() {

    velocidad.add(aceleracion);
    
    velocidad.mult(0.99);

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
    fill(c);
    noStroke();
    ellipse(posicion.x, posicion.y, radio * 2, radio * 2);
  }

  void acercar(PVector objetivo, float multiplicador) {

    PVector direccion = PVector.sub(objetivo, posicion);

    direccion.normalize();

    direccion.mult(multiplicador);

    aceleracion.add(direccion);
  }

  boolean chocaCon(Movil otro) {

    float distancia = PVector.dist(posicion, otro.posicion);

    return distancia < (radio + otro.radio);
  }

  void resolverColision(Movil otro) {

    PVector diferencia = PVector.sub(posicion, otro.posicion);

    float distancia = diferencia.mag();

    float minima = radio + otro.radio;

    if (distancia == 0) {
      diferencia = PVector.random2D();
      distancia = 1;
    }

    if (distancia < minima) {

      float superposicion = minima - distancia;

      diferencia.normalize();

      diferencia.mult(superposicion / 2);

      posicion.add(diferencia);
      otro.posicion.sub(diferencia);

      velocidad.mult(0.5);
      otro.velocidad.mult(0.5);
    }
  }
}
