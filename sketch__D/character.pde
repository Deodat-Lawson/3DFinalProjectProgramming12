int MouseThres = 0;
void move() {
  
  mapGrid[(int)(eyex+2000)/gridSize][(int)(eyez+2000)/gridSize] = 0;
  
  if (wkey && canMoveF()) {
    eyex+=cos(leftRightAngle)*20;
    eyez+=sin(leftRightAngle)*20;
  }
  if (akey && canMoveL()) {
    eyex+=cos(leftRightAngle-(PI/2))*20;
    eyez+=sin(leftRightAngle-(PI/2))*20;
  }
  if (skey && canMoveB()) {
    eyex-=cos(leftRightAngle)*20;
    eyez-=sin(leftRightAngle)*20;
  }
  if (dkey&& canMoveR()) {
    eyex+=cos(leftRightAngle+(PI/2))*20;
    eyez+=sin(leftRightAngle+(PI/2))*20;
  }
  if (spaceKey && MouseThres > 10) {
    objects.add(new Bullet());
    MouseThres = 0;
  }
  if(jump && jumpThres == 0){
   jumpTime = 4; 
   jumpB = 32;
   jumpThres = 40;
  }
  
  MouseThres++;
  if(MouseThres > 100){
   MouseThres = 100; 
  }


  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;

  if (upDownAngle > PI/(2.5)) {
    upDownAngle = PI/2.5;
  }

  if (upDownAngle < -PI/(2.5)) {
    upDownAngle = -PI/2.5;
  }
  
  mapGrid[(int)(eyex+2000)/gridSize][(int)(eyez+2000)/gridSize] = 4;


  if (frameCount < 2) {
    d.mouseMove(width/2, height/2);
    mouseX = width/2;
    mouseY = height/2;
  }
  if (mouseX < 1) {
    d.mouseMove(width-2, mouseY);
  } else if (mouseX > width-2) {
    d.mouseMove(1, mouseY);
  } 
  leftRightAngle += (mouseX - pmouseX)*0.01;
  upDownAngle    += (mouseY - pmouseY)*0.005;
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
}
