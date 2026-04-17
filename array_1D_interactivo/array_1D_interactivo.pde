int cols = 10;
int[] altura = new int[cols];

void setup(){
  size(500,500);
  
  for (int i = 0; i < cols; i++){
    altura[i] = height/2;
  } 
}

void draw(){
  background(255);
  
  int tamX = width / cols; 
  
  for (int i = 0; i < cols; i++){
    
    int posX = tamX * i;
    int posXNext = tamX * (i+1);
    
    rect(posX, height - altura[i], tamX, altura[i]);
    
    if (mouseX > posX && mouseX < posXNext){
      altura[i] = constrain(height - mouseY, 0, height);
    }
  }
}
