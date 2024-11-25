class Star {
  // member Variables
  int x, y, diam, speed;
  //constructor
  Star() {
    x = int(random(width));
    y = -10;
    diam = int(random(1, 4));
    speed = int(random(1, 3));
  }


  void display() {
    fill(255);
    stroke(int(random(255)));
    ellipse(x, y, diam, diam);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }
}