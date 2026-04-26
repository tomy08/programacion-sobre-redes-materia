int filas = 8;
int tam = 100;

void settings() {
  size(800, filas * tam);
}

void setup(){
  background(255);

  for (int i = 0; i < filas; i++) {
    float x = 0;
  
    while (x < width) {
      float y = i * tam;
      
      float ancho = random(tam,tam*2); // ancho variable
      float alto = tam;
    
      // esto evita que el ultimo elemento se pase del borde
      if (x + ancho > width) {
        ancho = width - x;
      }
    
      rect(x, y, ancho, alto);
      x += ancho;
    }
  }
}
