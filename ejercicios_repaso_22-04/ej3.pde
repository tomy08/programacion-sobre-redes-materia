int cant_lineas = 5;


void settings() {
  size(800,800);
}
void setup(){
  int gap = width / (cant_lineas-1);
  for (int i = 0; i < cant_lineas; i++){
    for (int j = 0; j < cant_lineas; j++){
    
      line(i*gap,0,j*gap,height); 
    }
  }
}
