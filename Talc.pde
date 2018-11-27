class Talc {
  final float e_max = 100;
  float efficiency;
  float line;
  
  Talc(float winW, float winH) {
    efficiency = e_max;
    line = winH/10;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    if(efficiency > 0) {
      efficiency -= 0.1;
    }
  }
  
  void display() {
    noStroke();
    fill(0xff,0xff,0xff,255*efficiency/100);
    rect(0, 0, width, line);
  }
}
