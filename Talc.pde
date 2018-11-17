class Talc {
  float efficiency;
  
  Talc() {
    efficiency = 1000;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    if(efficiency > 0) {
      efficiency -= 00.1;
    }
  }
  
  void display() {
    strokeWeight(0);
    fill(0xff,0xff,0xff,255*efficiency/100);
    rect(0, 0, width, height/10);
  }
}
