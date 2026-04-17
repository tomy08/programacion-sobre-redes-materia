int filas = 10;
int cols = 10;
int tam=100;
int paredes = 6;
boolean[][][] laberinto = new boolean[filas][cols][paredes];
/*
Tomando en cuenta que seria asi:
0 = arriba
1 = derecha
2 = abajo
3 = izquierda
4 = diagonal \
5 = diagonal /
*/

void settings() {
  size(cols * tam, filas * tam);
}

void setup(){  
  for (int i = 0; i < filas; i++){
    for  (int j = 0; j < cols; j++){
      
      // pared derecha
      boolean derecha = random(1) < 0.3;
      laberinto[i][j][1] = derecha;
    
      if (j < cols - 1){
        laberinto[i][j+1][3] = derecha;
      }
    
      // pared abajo
      boolean abajo = random(1) < 0.3;
      laberinto[i][j][2] = abajo;
    
      if (i < filas - 1){
        laberinto[i+1][j][0] = abajo;
      }
    
      // diagonales
      laberinto[i][j][4] = random(1) < 0.3;
      laberinto[i][j][5] = random(1) < 0.3;
      
    }
  }
}

void draw(){
  background(255);
  for (int i = 0; i < filas; i++){
    for (int j = 0; j < cols; j++){
        int posX = j * tam;
        int posY = i * tam;
        
        if (laberinto[i][j][0]){
          line(posX,posY,posX + tam,posY);
        }
        if (laberinto[i][j][1]){
          line(posX+tam,posY,posX+tam,posY);
        }
        if (laberinto[i][j][2]){
          line(posX,posY+tam,posX + tam,posY+tam);
        }
        if (laberinto[i][j][3]){
          line(posX,posY,posX,posY + tam);
        }
        if (laberinto[i][j][4]){
          line(posX,posY,posX + tam,posY + tam);
        }
        if (laberinto[i][j][5]){
          line(posX + tam,posY,posX,posY + tam);
        }
    }
  }

}
