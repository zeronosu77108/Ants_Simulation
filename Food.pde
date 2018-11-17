class Food {
  float leftover = 100;
  float max_size = 50;
  float x;
  float y;
  
  void run(){
    display();
  }

  void display() {
    float size = max_size * leftover / 300;
    x = width/2 - size*1.5/2;
    y = height/5*4;
    
    noStroke();
    fill(0x41,0x69,0xe1);
    rect(x, y, size*1.5 , size );
  }
  
}
