// Ulisses Pineda | Temp Converter | 9/23/24
int w, h, mx, my;
float f, c, temp, temps;
boolean mt;
String m;


void setup() {
  size(400, 200);
  windowResizable(true);
  background(120);
}

float tempftc(float f) {
  temp = (f-32.0)*(5.0/9.0);
  return temp;
}

float tempctf(float c) {
  temp = (c*(9.0/5.0))+32.0;
  return temp;
}

void draw() {
  mx = mouseX;
  my = mouseY;
  w = width;
  h = height;
  temp = 0.0;
  background(120);
  line(0, h-(h/3), w, h-(h/3));
  fill(60);
  textAlign(LEFT);
  rect(10, 10, 110, 30);
  fill(255);
  line(mx, h-(h/3)+15, mx, h-(h/3)+5);
  if (mt) {
    textAlign(LEFT);
    text("Line = Celsius", 16, 23);
    text("Output = Fahrenheit", 16, 35);
    m = "Fahrenheit";
    textAlign(CENTER);
    text(m+" : "+ tempctf(mx-(w/2)), w/2, h/2);
    text(mx-(w/2) + "  Celsius", mx, h-(h/3)+25);
  } else {
    textAlign(LEFT);
    text("Line = Fahrenheit", 16, 23);
    text("Output = Celsius", 16, 35);
    m = "Celsius";
    textAlign(CENTER);
    text(m+" : "+ tempftc(mx-(w/2)), w/2, h/2);
    text(mx-(w/2) + "  Fahrenheit", mx, h-(h/3)+25);
  }

  for (int i=0; i<w; i+=25) {
    line(i, (h-(h/3))-5, i, (h-(h/3))+5);
    textAlign(CENTER);
    text(i-(w/2), i, (h-(h/3))-15);
  }
  temps = (mx-(w/2));
  println(mx);
  text("Made By Ulisses Pineda", w-70, h-10);
  text("To change what temperature is represented", w-110, 10);
  text("on the line, Mouse click!", w-110, 20);
}

void mousePressed() {
  if (mousePressed) {
    mt = !mt;
  }
}
