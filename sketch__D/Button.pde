class Button {

  int xPos;
  int yPos;
  int xSize;
  int ySize;
  color c;
  color t;
  String text;
  int textSize;
  boolean trans;

  Button(int x, int y, int sx, int sy, color c, color touch, String text, int tSize, boolean transp) {
    xPos = x;
    yPos = y;
    xSize = sx;
    ySize = sy;
    this.c = c;
    trans = transp;
    t=touch;
    this.text = text;
    textSize = tSize;
  }


  void show() {
    touchingBox();
  }



  void touchingBox() {
    rectMode(CENTER);

    if (trans) {
      noFill();
    } else {
      fill(100);
    }
    if (touching()) {
      stroke(t); 
      rect(xPos, yPos, xSize, ySize);
      fill(t);
      textSize(textSize);
      text(text, xPos, yPos+10);
    } else {
      stroke(c);
      rect(xPos, yPos, xSize, ySize);
      fill(c);
      textSize(textSize);
      text(text, xPos, yPos+10);
    
    }
    
    rectMode(LEFT);
  }


  boolean touching() {
    return (mouseX <= xPos+(xSize/2) && mouseX >= xPos-(xSize/2) && mouseY <= yPos+(ySize/2) && mouseY >= yPos-(ySize/2));
  }
}
