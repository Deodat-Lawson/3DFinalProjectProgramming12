class Spiral extends GameObject { //<>//

  int i;
  int time;
  //ArrayList<PImage> spirals;


  Spiral() {

    lives = 1;
    loc = new PVector(random(-1000, 1000), height - size, random(-1000, 1000));
    loc.x/=100;
    loc.z/=100;
    loc.x*=100;
    loc.z*=100;
    if (mapGrid[(int)((loc.x+2000)/gridSize)][(int)((loc.z+2000)/gridSize)] != 0) {
      lives = 0;
    } else {
      mapGrid[(int)((loc.x+2000)/gridSize)][(int)((loc.z+2000)/gridSize)] = 5;
    }


    size = 100;
  }

  void act() {
    i++;
    i = i % 32;
    time ++;
    if (time > 2000) {
      objects.add(new Spiral());
      lives = 0;
    }


    if (Math.abs(eyex - loc.x) < 200 && Math.abs(eyez - loc.z) < 200) {
      mapGrid[(int)(loc.x+2000)/gridSize][(int)(loc.z+2000)/gridSize] = 0;
      hearts+=random(-50, 70);
      lives = 0;
    }
  }

  void show() {
    world.pushMatrix();
    //translate(loc.x, -1950, loc.z);
    texturedCube(loc.x, height - size, loc.z, s.get(i), s.get(i), s.get(i), s.get(i), s.get(i), s.get(i), size, size, size);
    world.popMatrix();
  }
}
