int timeMouse = 0;

void keyPressed() {
  if (key == 'W' || key == 'w') {
    wkey = true;
  }
  if (key == 'S' || key == 's') {
    skey = true;
  }
  if (key == 'A' || key == 'a') {
    akey = true;
  }
  if (key == 'D' || key == 'd') {
    dkey = true;
  }
  if (key == ' ') {
    jump = true;
  }
}

void mouseReleased() {
  if (gameM == HOME) {
    if (startButton.touching()) {
      gameM = GAME;
    }
  } else if (gameM == GAME) {
    if (pauseButton.touching()) {
      gameM = PAUSE;
      spaceKey = false;
    } else {
      spaceKey = false;
    }
  } else if (gameM ==  PAUSE) {
    if (pauseButton.touching()) {
      gameM = GAME;
    }
  } else if (gameM == END) {
    if (playAgain.touching()) {
      gameM = HOME;

      resetVar();
    }
  }
}

void mousePressed() {
  if (gameM == GAME) {
    spaceKey = true;
  }
}

void keyReleased() {
  if (key == 'W' || key == 'w') {
    wkey = false;
  }
  if (key == 'S' || key == 's') {
    skey = false;
  }
  if (key == 'A' || key == 'a') {
    akey = false;
  }
  if (key == 'D' || key == 'd') {
    dkey = false;
  }
  if (key == ' ') {
    jump = false;
  }
}

void resetVar() {

  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  
  objects = new ArrayList<GameObject>();
  zombies = new ArrayList<GameObject>();

  for (int i = 0; i < 32; i++) {
    s.add(loadImage("00"+i+".png"));
  }

  for (int i = 0; i < 18; i++) {
    back.add(loadImage("000"+i+".png"));
  }

  for (int i = 0; i < 3; i++) {
    objects.add(new Spiral());
    zombies.add(new zombie());
  }

  tFOrZ = 0;
  hearts = 200;
  spi = 0;
  zBack = 20;

  eyex = width/2;
  eyey = 0.8*height;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2-100;
}
