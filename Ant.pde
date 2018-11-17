class Ant {
  float x;
  float y;

  float hunger;
  float direction;
  boolean satisfied;

  int size = 10;
  int speed = 1;

  Ant(Talc talc) {
    this.x = round(random(0, width));
    this.y = round(random(talc.line+size, height));
    this.direction = round(random(0, 360));
    this.hunger = round(random(30, 100));
    hunger = 0;
  }

  void run(Talc talc) {
    update(talc);
    display();
  }

  void update(Talc talc) {
    if ( hunger > 0 ) {
      hunger -= 0.05;
    }

    satisfied = (hunger<25) ? false : true;

    cal_direction();
    cal_position(talc);
  }

  void display() {
    fill(0x80, 0x00, 0x00);
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
    if ( satisfied == false ) {
      dicide_direction(-90);
    } else {
      direction += random(-3,3);
    }
  }
  
  void dicide_direction(float theta) {
    boolean roteto = theta>direction ? !(theta - direction > 180.0) : (direction - theta > 180.0);
    if( roteto = true ) {
      direction += (-abs(theta - direction) +360)%360 * random(0.02,0.05) * 0.5;
    } else {
      direction += (-abs(theta - direction) -360)%360 * random(0.02,0.05) * 0.5;
    }
  }

  // 移動系 後で直す
  void cal_position(Talc talc) {
    if ( y+speed*sin(radians(direction)) < talc.line + size + 2) {
    } else {
      x = x + speed * cos(radians(direction));
      x = (x>width) ? x%width : x;
      x = (x<0) ? x+width : x;
      y = y + speed * sin(radians(direction));
    }
  }
}
