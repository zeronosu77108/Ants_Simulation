class Talc {
  float efficiency;
  float line;
  
  Talc(float winW, float winH) {
    efficiency = 1000;
    line = winH/10;
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
    noStroke();
    fill(0xff,0xff,0xff,255*efficiency/100);
    rect(0, 0, width, line);
  }
}
