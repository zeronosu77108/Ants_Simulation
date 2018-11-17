
int n_of_ants = 50;
Ant ants[] = new Ant[n_of_ants];
Talc talc = new Talc();

void setup() {
  size(1024, 768);

  for (int i=0; i<n_of_ants; i++) {
    ants[i] = new Ant();
  }
}

void draw() {
  draw_background();
  
  talc.run();
  for(Ant ant : ants) {
    ant.run();
  }
  
  if ((keyPressed == true) && ((key == 't') || (key == 'T'))) {
    talc.efficiency = 1000;
  }
  
}

void draw_background() {
  background(0xee);
  strokeWeight(0);
  fill(0xff,0xff,0xe0);
  rect(0, height/3*2, width, height/3);
}
