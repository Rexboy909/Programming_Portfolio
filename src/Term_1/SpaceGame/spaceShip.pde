class spaceShip {
  // Member Variables
  int x, y, w, laserCount, turretCount, health;
  // Constructor
  spaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 1000;
    turretCount = 1;
    health = 100;
  }
  // Member Methods
  void display() {
    fill(0);
    stroke(1);
    triangle(x, y-15, x+30, y+20, x-30, y+20); // closer wing section
    quad(x-6, y, x-3, y-25, x+3, y-25, x+6, y);
    quad(x-6, y, x-3, y+25, x+3, y+25, x+6, y);
    fill(50);
    triangle(x-3, y-25, x+3, y-25, x, y-35);
    fill(120, 120, 170);
    ellipse(x, y-12, 7, 12);
    fill(255, 140, 0);
    noStroke();
    triangle(x-3, y+25, x+3, y+25, x, y+70);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean canFire() {
    if (laserCount < 1) {
      return false;
    } else {
      return true;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam) {
      return true;
    } else {
      return false;
    }
  }
}
