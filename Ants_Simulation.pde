
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
}

void draw() {
  draw_background();
  
  talc.run();
  for(Ant ant : ants) {
    ant.run(talc);
  }
  if( food != null) {
    food.run();
    if( food.leftover <= 0 ) {
      food = null;
    }
  }
  if( pheromones != null) {
    pheromones.run();
  }
  
  if ((keyPressed == true) && ((key == 't') || (key == 'T'))) {
    talc.efficiency = 1000;
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
