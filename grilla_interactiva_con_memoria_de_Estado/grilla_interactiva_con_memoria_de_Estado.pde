int filas = 10;
int cols = 10;
boolean[][] estado = new boolean[filas][cols];
int cantFilas,cantCols;

void setup(){
  size(800,800);
}

void draw(){
  background(255);
  cantFilas = width/filas;
  cantCols = height/cols;
  
  for (int i = 0; i < filas; i++){
    for (int j = 0; j < cols; j++){
      int posX = cantFilas*j;
      int posY = cantCols*i;
      
      if (estado[i][j] == false){
        rect(posX,posY,cantFilas,cantCols);
      }else{
        dibujarFigura(posX,posY,cantCols);
      }
    }
  }
}

void dibujarFigura(int x, int y,int s) {
  fill(255,0,0);
  rect(x,y,s,s);
  ellipse(x + s/2, y + s/2, s/3,s/3);
  fill(250);
}

void mousePressed(){
  int mouseColumna = mouseX / cantCols;
  int mouseFila = mouseY / cantFilas;
   
   estado[mouseFila][mouseColumna] = !estado[mouseFila][mouseColumna];
  
  
}
