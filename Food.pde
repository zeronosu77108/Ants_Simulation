class Food {
  float leftover = 100;
  float max_size = 150;
  float x;
  float y;
  float size;
  
  void run(){
    display();
  }

  void display() {
    size = max_size * leftover / 350;
    x = width/2;
    y = height/5*4 - size/2;
    
    noStroke();
    fill(0x41,0x69,0xe1);
    rect(x-size/2, y -size/2, size , size );
    
    fill(0xff,0x00,0x00);
    rect(x, y, 1 , 1 );
    System.out.println(x);
    System.out.println(y);
  }
  
}
