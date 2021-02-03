

void drawCrosshair() {
  HUD.strokeWeight(5);
  HUD.stroke(white);
  HUD.line(width/2 - 20, height/2, width/2 + 20, height/2);
  HUD.line(width/2, height/2 - 20, width/2, height/2 + 20);
}


void drawMiniMap() {

  HUD.image(map, 50, 50, 160, 160);
  int miniX = int(eyex+2000)/gridSize;
  int miniY = int(eyez+2000)/gridSize;
  HUD.textSize(20);
  HUD.strokeWeight(3);
  HUD.fill(white);
  HUD.text(""+miniX+","+miniY,50,250);
  HUD.text("lives: "+(int)(hearts/20),50,280);
  
  HUD.strokeWeight(0);
  HUD.stroke(255,0,0);
  HUD.fill(255,0,0);
  HUD.rect(miniX*4+50,miniY*4+50,4,4);
}
