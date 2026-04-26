int filas = 8;
int cols = 8;
int tam=100;

void settings() {
  size(cols * tam, filas * tam);
}

void draw(){
  background(255);
  int colorVal = 0;
  
  for (int i = 0; i < filas; i++){
    for (int j = 0; j < cols; j++){
        int posX = j * tam;
        int posY = i * tam;
        
        if (j != 0) colorVal = colorVal == 0 ? 255 : 0;     
  
        fill(colorVal);
        rect(posX,posY,tam,tam);
    }
  }
  
}
