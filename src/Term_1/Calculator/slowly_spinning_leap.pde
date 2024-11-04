//Ulisses Pineda | Calculator | 10/2/24
int w, h, mx, my;
Button[] buttons = new Button[25];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(420, 540);
  windowResizable(true);
  background(0);
  l = 0;
  r = 0;
  result = 0;
  op = ' ';
  left = true;
  buttons[0] = new Button(210, 490, "0", 60, 60, 160, 100, true);
  buttons[1] = new Button(210, 410, "1", 60, 60, 160, 100, true);
  buttons[2] = new Button(290, 410, "2", 60, 60, 160, 100, true);
  buttons[3] = new Button(370, 410, "3", 60, 60, 160, 100, true);
  buttons[4] = new Button(210, 330, "4", 60, 60, 160, 100, true);
  buttons[5] = new Button(290, 330, "5", 60, 60, 160, 100, true);
  buttons[6] = new Button(370, 330, "6", 60, 60, 160, 100, true);
  buttons[7] = new Button(210, 250, "7", 60, 60, 160, 100, true);
  buttons[8] = new Button(290, 250, "8", 60, 60, 160, 100, true);
  buttons[9] = new Button(370, 250, "9", 60, 60, 160, 100, true);
  buttons[10] = new Button(50, 170, "Clr", 60, 60, #FF3C3C, #902222, false);
  buttons[11] = new Button(130, 170, "÷", 60, 60, 160, 100, false);
  buttons[12] = new Button(210, 170, "x", 60, 60, 160, 100, false);
  buttons[13] = new Button(290, 170, "-", 60, 60, 160, 100, false);
  buttons[14] = new Button(370, 170, "+", 60, 60, 160, 100, false);
  buttons[15] = new Button(290, 490, ".", 60, 60, 160, 100, false);
  buttons[16] = new Button(370, 490, "+/-", 60, 60, 160, 100, false);
  buttons[17] = new Button(50, 490, "=", 60, 60, #5e973f, #314f21, false);
  buttons[18] = new Button(50, 250, "π", 60, 60, 160, 100, false);
  buttons[19] = new Button(130, 250, "^2", 60, 60, 160, 100, false);
  buttons[20] = new Button(50, 330, "√", 60, 60, 160, 100, false);
  buttons[21] = new Button(130, 330, "log", 60, 60, 160, 100, false);
  buttons[22] = new Button(50, 410, "sin", 60, 60, 160, 100, false);
  buttons[23] = new Button(130, 410, "cos", 60, 60, 160, 100, false);
  buttons[24] = new Button(130, 490, "tan", 60, 60, 160, 100, false);
}

void draw() {
  background(0);
  w = width;
  h = height;
  mx = mouseX;
  my = mouseY;
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mx, my);
  }
  updateDisplay();
}

void updateDisplay() {
  fill(200);
  rectMode(CENTER);
  rect(w/2, 70, 380, 100, 5);
  fill(0);
  textSize(40);
  textAlign(RIGHT);
  text(dVal, width-25, 50);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<19) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length()<19) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("Clr")) {
      dVal = "0";
      l = 0;
      r = 0;
      result = 0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      handleEvent(".", false);
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      handleEvent("x", false);
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      op = 'π';
      if (left) {
        dVal += str(PI);
        l = float(dVal);
      } else {
        dVal += str(PI);
        r = float(dVal);
      }
      left = false;
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      handleEvent("ENTER", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+/-")) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else if (left == false) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left == true) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left == false) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^2")) {
      if (left == true) {
        l = pow(l, 2);
        dVal = str(l);
      } else if (left == false) {
        r = pow(r, 2);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("log")) {
      if (left == true) {
        l = log(l);
        dVal = str(l);
      } else if (left == false) {
        r = log(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("sin")) {
      if (left == true) {
        l = sin(l);
        dVal = str(l);
      } else if (left == false) {
        r = sin(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("cos")) {
      if (left == true) {
        l = cos(l);
        dVal = str(l);
      } else if (left == false) {
        r = cos(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("tan")) {
      if (left == true) {
        l = tan(l);
        dVal = str(l);
      } else if (left == false) {
        r = tan(r);
        dVal = str(r);
      }
    }
    // println("left: " + l + " Right: " + r + " Result: " + result + " Op: " + op + " L: " + left);
  }
}

void performCalc() {
  if (op=='+') {
    result = l + r;
    dVal = str(result);
  } else if (op=='-') {
    result = l - r;
    dVal = str(result);
  } else if (op=='x') {
    result = l * r;
    dVal = str(result);
  } else if (op=='/') {
    result = l / r;
    dVal = str(result);
  }
}

// listen for keyboard inputs
void keyPressed() {
  println("Key: " + key);
  println("KeyCode: " + keyCode);
  if ( key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if ( key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if ( key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if ( key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if ( key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if ( key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if ( key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if ( key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if ( key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if ( key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if ( key == '.' || keyCode == 110 || keyCode == 46) {
    handleEvent(".", false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("ENTER", false);
  } else if ( key == 'x' || key == '*' || keyCode == 88 || keyCode == 106 || keyCode == 56) {
    handleEvent("x", false);
  } else if ( key == '/' || keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  } else if ( key == '-' || keyCode == 109 || keyCode == 45) {
    handleEvent("-", false);
  } else if ( key == '+' || keyCode == 107 || keyCode == 61) {
    handleEvent("+", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<19 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length()<19 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    op = '+';
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    left = false;
    op = '-';
    dVal = "0";
  } else if (keyVal.equals("x") && !isNum) {
    left = false;
    op = 'x';
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    left = false;
    op = '/';
    dVal = "0";
  } else if (keyVal.equals("ENTER") && !isNum) {
    performCalc();
  } else if (keyVal.equals(".") && !isNum) {
    if (!dVal.contains(".")) {
      dVal += keyVal;
    }
  }
}
