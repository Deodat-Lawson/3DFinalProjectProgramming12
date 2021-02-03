float moveEnd = 0;

void end(){
  
  rectMode(RIGHT);
  noStroke();
  fill(100,0,0,2);
  rect(0,0,width,height);
  
  textAlign(CENTER);
  fill(255);
  

  textSize(100+moveEnd);
  text("You died",width/2, height/2-100);

  
  
  if(moveEnd <= 5){
   moveEnd+=0.1; 
  }
  else if(moveEnd >= 5){
    moveEnd = 0;
  }
  
  
  
  rectMode(CENTER);
  playAgain.show();
  
  
}
