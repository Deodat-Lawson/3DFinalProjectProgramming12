int transparency = 0;
boolean fade = false;

void starts() {
  background(0);
  image(introLogo, width/2, height/2);
  tint(255, transparency);

  fading();
  if(transparency < -60){
    gameM = HOME;
  }
}


//--------------------------------
void fading() {
  if (transparency >= 255) {
    fade = true;
  }


  if (fade) {
    transparency-=1;
  } else {
    transparency+=1;
  }
}
