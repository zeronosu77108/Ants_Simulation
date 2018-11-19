class Ant {
  Talc talc;
  Pheromone p;
  Food food;
  
  float x;
  float y;
  int red;
  int green;
  int blue;

  float hunger;
  float direction;
  boolean satisfied;

  int size = 10;
  int speed = 1;
  int mode = 0;
  /**********************
  *  0 : 徘徊 (満腹状態)
  *  1 : 探索（普通）
  *  2 : 探索 (空腹)
  *  3 : 誘引
  *  4 : 採取
  **********************/
  
  float r = 50;


  Ant(Talc talc) {
    this.talc = talc;
    this.x = round(random(0, width));
    this.y = round(random(talc.line+size, height));
    this.direction = round(random(0, 360));
    this.hunger = round(random(70, 100));
  }

  void run(Pheromone p, Food food) {
    this.p = p;
    this.food = food;
    update();
    display();
  }

  void update() {
    if ( hunger > 0 ) {
      hunger -= 0.02;
    }

    switch_mode();
    
    cal_direction();
    cal_position();
  }

  void display() {
    fill(red, green, blue);
    strokeWeight(.5);

    pushMatrix();
    translate(x, y);
    rotate(radians(-direction));
    beginShape();
    vertex(size*cos(radians(360*1/3)), size*sin(radians(360*1/3)));
    vertex(size*cos(radians(360*2/3)), size*sin(radians(360*2/3)));
    vertex(size*cos(radians(360*3/3))+5, size*sin(radians(360*3/3)));
    endShape(CLOSE);

    popMatrix();
  }

  // 後で直す
  void cal_direction() {
    switch(mode) {
      case 0:  // 徘徊 (満腹状態)
        red=0xff; green=0xc7; blue=0xaf;
        direction += random(-3,3);
        break;
      case 1:  // 探索（普通）
        red=0x80; green=0x00; blue=0x00;
        direction += random(-5,5);
        break;
      case 2:  // 探索 (空腹)
        red=0xff; green=0xc0; blue=0xcb;
        dicide_direction(90);
        break;
      case 3:  // 誘引
        red=0xff; green=0x14; blue=0x93;
        direction = -degrees(atan2(p.y - this.y, p.x - this.x));
        break;
      case 4:  // 採取
        red=0x4b; green=0x00; blue=0x82;
        direction = -degrees(atan2(food.y - this.y, food.x - this.x));
        break;
    }
  }
  
  void dicide_direction(float theta) {
    boolean roteto = theta>direction ? !(theta - direction > 180.0) : (direction - theta > 180.0);
    if( roteto ) {
      direction += (-abs(theta - direction) +360)%360 * random(0.02,0.05) * 0.5;
    } else {
      direction += (-abs(theta - direction) -360)%360 * random(0.02,0.05) * 0.5;
    }
    direction += random(-3,3);
  }

  // 移動系 後で直す
  void cal_position() {
    if ( y+speed*sin(radians(-direction)) < talc.line + size + 2) {
      if( mode != 2) {
        direction += direction;
      }
    } else {
      x = x + speed * cos(radians(-direction));
      x = (x>width) ? x%width : x;
      x = (x<0) ? x+width : x;
      y = y + speed * sin(radians(-direction));
    }
    if( mode==4 && (food!=null) && is_in_f_area(food.size)){
      food.leftover --;
      this.hunger = 100;
    }
  }
  
  void switch_mode() {
    if( (mode==1 || mode==2 || mode==3 || mode==4) && (food!=null) && is_in_f_area(100) ) {
      mode = 4;  // 採取
    } else  if( (mode==1 || mode==2 || mode==3) && (p != null) && is_in_p_area(50) ) {
      mode = 3;  // 誘引
    } else if( hunger <= 15) {
      mode = 2;  // 空腹
    } else if (hunger <= 80) {
      mode = 1;  // 普通
    } 
    if (hunger > 80) {
      mode = 0;  // 徘徊
    }
  }
  
    boolean is_in_f_area(float r) {
    return (this.x - r < food.x) && (this.x + r > food.x) && (this.y - r < food.y) && (this.y + r > food.y);
  }
  
  boolean is_in_p_area(float r) {
    return (this.x - r < p.x) && (this.x + r > p.x) && (this.y - r < p.y) && (this.y + r > p.y);
  }
}
