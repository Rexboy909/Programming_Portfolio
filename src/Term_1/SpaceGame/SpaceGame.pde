//Ulisses Pineda Guzman | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laser;
spaceShip s1;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, lvl;
boolean play;
Timer rTime, puTime;

void setup() {
  size(1000, 1000);
  s1 = new spaceShip();
  score = 0;
  lvl = 1;
  play = false;
  rTime = new Timer(1000-((lvl)/2));
  puTime = new Timer(7000);
  laser = new SoundFile(this, "GUN_SHOT.WAV");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(30);
    if (frameCount % 1000 == 0) {
      lvl += 1;
    }
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i=0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type == 'h') {
        // remove puwup
        powups.remove(pu);
        // health benifit
        s1.health += 50;
        // laser burst
        // ammo increase
        // turret count
        // heat seeking ammo
        // time credit
        // remove all enemies
        // score multiplier, time based
        // alter speed of enemy obj, time based
        // orbiting shield obj. time based
        // temp invincibility
      } else  if (pu.intersect(s1) && pu.type == 'a') {
        // remove puwup
        powups.remove(pu);
        // health benifit
        s1.laserCount += 500;
      } else  if (pu.intersect(s1) && pu.type == 'd') {
        // remove puwup
        powups.remove(pu);
        // health benifit
        s1.laserCount += 500;
      } else  if (pu.intersect(s1) && pu.type == 't') {
        // remove puwup
        powups.remove(pu);
        // health benifit
        if (s1.turretCount == 1) {
          s1.turretCount = 2;
        } else if (s1.turretCount == 2) {
          s1.turretCount = 3;
        } else if (s1.turretCount == 3) {
          s1.turretCount = 4;
        } else if (s1.turretCount == 4) {
          s1.turretCount = 5;
        }
      }
      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }



    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          score += rock.diam;
          s1.health += 1;
          rocks.remove(rock);
          lasers.remove(laser);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        // remove 99 health
        s1.health -= 99;
        // deduct 20 points
        score -= 10;
        // remove rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
        score -= 100;
        s1.health -= 99;
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
    }
  }
}
void keyPressed() {
  if (!laser.isPlaying()) {
    laser.play();
  }
  if (keyPressed && key == ' ' && s1.canFire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount -= 1;
  } else if (keyPressed && key == ' ' && s1.canFire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    s1.laserCount -= 2;
    laser.play();
  } else if (keyPressed && key == ' ' && s1.canFire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    s1.laserCount -= 3;
    laser.play();
  } else if (keyPressed && key == ' ' && s1.canFire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    s1.laserCount -= 4;
    laser.play();
  } else if (keyPressed && key == ' ' && s1.canFire() && s1.turretCount == 5) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount -= 5;
    laser.play();
  }
}

void mousePressed() {
  if (s1.canFire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount -= 1;
  } else if (s1.canFire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    s1.laserCount -= 2;
  } else if (s1.canFire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    s1.laserCount -= 3;
  } else if (s1.canFire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    s1.laserCount -= 4;
  } else if (s1.canFire() && s1.turretCount == 5) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    s1.laserCount -= 5;
  }
}

void infoPanel() {
  rectMode(CENTER);
  textAlign(LEFT);
  fill(127, 127);
  rect(width/2, 40, width, 80);
  fill(0);
  textSize(30);
  text("Score: " + score, 20, 30);
  text("Health: " + s1.health, 180, 30);
  text("Level: " + lvl, 380, 30);
  text("Ammo: " + s1.laserCount, 540, 30);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("Welcome to Spacegame", width/2, 300);
  text("Please Click to Start", width/2, 400);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  textAlign(CENTER);
  fill(0);
  background(0);
  fill(255);
  textSize(50);
  text("Game Over", width/2, height/2-40);
  textSize(30);
  text("Restart Program to try again", width/2, (width/2));
  text("Score: " + score, width/2, (height/2)+40);
  text("Level: " + lvl, width/2, (height/2)+80);
  noLoop();
}

void ticker() {
}
