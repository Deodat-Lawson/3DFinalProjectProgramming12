int tFOrZ = 0;
int hearts = 200;
int spi = 0;
int zBack = 20;

boolean hurt = false;

void game() {
  pauseButton = new Button(width-50, 50, 50,50,color(255),color (255,0,0),"||",20,false);
  
  objects.add(new Sparks());
  
  tFOrZ++;
  if (tFOrZ == 1) {
    zombies.add(new zombie());
  } else if ( tFOrZ >= 100) {
    tFOrZ = 0;
  }
  
  if(zBack > 0){
   zBack--; 
  }


  spi++;
  if (spi == 1) {
    objects.add(new Spiral());
  } else if ( spi >= 1000) {
    spi = 0;
  }

  //jump
  jump();
  jumpCheck();


  N++;
  N%=18;

  world.textureMode(NORMAL);

  world.beginDraw();

  //world.background(135,206,235);
  world.background(0);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  world.lightFalloff(1.5, 0, 0);
  world.ambientLight(255, 255, 255);
  world.pointLight(255, 255, 255, eyex, eyey, eyez);

  world.pushMatrix();
  world.translate(-3000, -2000, -3000);
  texturedCube(0, 0, 0, back.get(N), empty, empty, empty, empty, empty, 9000, 9000, 9000);
  world.popMatrix();   

  drawAxes();
  move();
  drawMap();

  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
      i--;
    }
    i++;
  }



  i = 0;
  while (i < zombies.size()) {
    GameObject obj = zombies.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      zombies.remove(i);
      i--;
    }
    i++;
  }


  world.endDraw();

  image(world, 0, 0);


  HUD.beginDraw();
  HUD.clear();
  if (hurt) {
    HUD.background(255, 0, 0, 30); 
    if(zBack <= 0){
    jumpTime = 3; 
    jumpB = 16;
    zBack = 20;
    }
    hurt = false;
  }
  drawCrosshair();
  drawMiniMap();
  HUD.endDraw();

  image(HUD, 0, 0);

  pauseButton.show();
  
  if (hearts <= 0) {
    gameM = END;
  }
}




void jumpCheck() {
  if (eyey < 0.8*height) {
    jumpB -= 2;
    eyey -= jumpB;
  } else {
    eyey = 0.8*height;
  }

  if (jumpThres > 0) {
    jumpThres--;
  }
  if (jumpThres < 0) {
    jumpThres = 0;
  }
}


void jump() {
  if (jumpTime > 0) {
    eyey -= jumpB;
    jumpTime--;
  } else {
    jumpTime = 0;
  }
}
