int move = 0;
void home(){
  background(0);
  noTint();
  image(home, width/2, height/2,width,height);
  textSize(70+move);
  fill(255);
  text("<< Timothy's craft >>", width/2+move,300);
  if(move <= 20){
   move++; 
  }
  else if(move >= 20){
    move = 0;
  }
  startButton.show();
  
}
