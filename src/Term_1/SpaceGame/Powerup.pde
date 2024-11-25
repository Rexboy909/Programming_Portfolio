class Powerup {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;
  char type;
  // Constructor
  Powerup() {
    x = int(random(width));
    y = -40;
    diam = 30;
    speed = int(random(1, 5));
    
    r1 = loadImage("PowUp.gif");
    int rand = int(random(0, 4));
    if (rand == 0) {
      type = 'h';
    } else if(rand == 1) {
      type = 'a';
    } else if(rand == 2) {
      type = 'd';
    } else if(rand == 3) {
      type = 't';
    }
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(spaceShip s) {
    float d = dist(x, y, s.x, s.y);
    if (d<diam) {
      return true;
    } else {
      return false;
    }
  }
}
