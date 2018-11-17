class Ant {
  float x;
  float y;
  
  float hunger;
  float direction;
  boolean satisfied;
  
  int size = 15;
  int speed = 1;
  
  Ant() {
   this.x = round(random(width/5,width));
   this.y = round(random(0,height));
   this.direction = round(random(0,360));
   this.hunger = round(random(30,100));
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    if( hunger > 0 ) {
      hunger -= 0.1;
    }
    
    satisfied = (hunger<25) ? false : true;
    
    cal_direction();
    cal_position();    
  }
  
  void display() {
    fill(0x80,0x00,0x00);
    strokeWeight(.5);
    
    pushMatrix();
    translate(x, y);
    rotate(radians(direction));
    beginShape();
      vertex(size*cos(radians(360*1/3)), size*sin(radians(360*1/3)));
      vertex(size*cos(radians(360*2/3)), size*sin(radians(360*2/3)));
      vertex(size*cos(radians(360*3/3))+5, size*sin(radians(360*3/3)));
    endShape(CLOSE);
    
    popMatrix();
  }
  
  // 後で直す
  void cal_direction() {
    if( satisfied == false ){
      direction += (-90 - direction) * random(0.005,0.01);
    }
  }
  
  // 移動系 後で直す
  void cal_position() {
    x = x + speed * cos(radians(direction));
    x = (x>width) ? x%width : x;
    x = (x<0) ? x+width : x;
    y = y + speed * sin(radians(direction));
  }
}
