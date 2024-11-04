//Ulisses Pineda | Calculator | 10/2/24
class Button {
  // Member Variables
  int x, y, w, h;
  color mc, rc;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, String val, int w, int h, color mc, color rc, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.mc = mc;
    this.rc = rc;
    this.val = val;
    this.isNum = isNum;
    on=false;
  }

  // Member Methods
  void display() {
    if (on == true) {
      fill(rc);
    } else {
      fill(mc);
    }
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    rect(x, y, w, h, 10);
    fill(0);
    textSize(40);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-(w/2) && mx < x+(w/2) && my > y-(h/2) && my < y+(h/2)) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
