class Pheromone {
  float x;
  float y;
  float size = 5;
  float efficiency = 100;
  int level;
  
  Pheromone(float x, float y, int level) {
    this.x = x;
    this.y = y;
    this.level = level;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    efficiency -= 1.1;
  }
  
  void display() {
    noStroke();
    if( level == 1 ) {
      fill(0xff,0x00,0xff, 255*efficiency/100);
    } else if ( level == 2) {
      fill(0xee,0x82,0xee, 255*efficiency/100);
    } else {
      fill(0x00, 255*efficiency/100);
    }
    rect(x - size/2, y - size/2, size , size );
  }
}
