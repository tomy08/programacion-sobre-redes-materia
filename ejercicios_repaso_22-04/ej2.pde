int circulos = 8;
int radio = 10;

void settings() {
  size(800,800);
}
void setup(){
  noFill();           
  stroke(0);          
  strokeWeight(2);  
  int posX = radio/2;

  for (int i = 0; i < circulos; i++){
    circle(posX, height/2, radio);
    
    int radioAnterior = radio; 
    radio *= 2;              
    
    posX += (radioAnterior/2 + radio/2); 
  }
}
