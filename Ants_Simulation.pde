
int n_of_ants = 200;
Ant ants[] = new Ant[n_of_ants];
Pheromone pheromones;
Talc talc = new Talc(1024, 768);
Food food;

void setup() {
  size(1024, 768);

  for (int i=0; i<n_of_ants; i++) {
    ants[i] = new Ant(talc);
  }
  food = null;
  pheromones = null;
}

void draw() {
  draw_background();
  
  if( talc != null ) {
    talc.run();
    
    if( talc.efficiency == 0 ) {
      talc = null;
    }
  }
  
  
  Pheromone t = pheromones;
  for(Ant ant : ants) {
    ant.run(t, food, talc);
    if( ant.t != null ) {
      pheromones = ant.t;
    }
  }
  
  if( food != null) {
    food.run(); //<>//
    if( food.leftover <= 0 ) {
      food = null;
    }
  }
  if( pheromones != null) {
    pheromones.run();
    
    if(pheromones.efficiency <= 0) {
      pheromones = null;
    }
  }
  
  if ((keyPressed == true) && ((key == 't') || (key == 'T'))) {
    talc = new Talc(1024,768);
    talc.efficiency = talc.e_max;
  }
  
  if ((keyPressed == true) && ((key == 'f') || (key == 'F'))) {
    food = new Food();
  }
    
}

void draw_background() {
  background(0xee);
  strokeWeight(0);
  fill(0xff,0xff,0xe0);
  rect(0, height/3*2, width, height/3);
}

void mouseClicked() {
  pheromones = new Pheromone(mouseX, mouseY, 1);
}

void keyReleased() {
  if ((key == 'r') || (key == 'R')) {
    setup();
  }
}
