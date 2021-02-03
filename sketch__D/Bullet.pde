class Bullet extends GameObject {

  PVector dir;
  float speed;

  Bullet() {
    super(eyex, eyey, eyez, 10);
    speed = 50;
    float vx = cos(leftRightAngle), vy = tan(upDownAngle), vz = sin(leftRightAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }

  void act() {
    int hitx = int(loc.x + 2000)/gridSize;
    int hity = int(loc.z + 2000)/gridSize;
    

     for(int i = 0; i < zombies.size(); i++){
      GameObject thisZ = zombies.get(i);
      if(Math.abs(thisZ.loc.x - loc.x) < 100 && Math.abs(thisZ.loc.z - loc.z) < 100){
       thisZ.lives = 0; 
       lives = 0;
       for (int j = 0; j < 5; j++) {
        objects.add(new Particle(loc));
      }
      }
     }
    
      
    
    if (map.get(hitx, hity) == white) {
      if (loc.y >= height) {
        lives = 0;
        for (int i = 0; i < 5; i++) {
          objects.add(new Particle(loc));
        }
      }
      loc.add(dir);
    } else {
      lives = 0;
      for (int i = 0; i < 5; i++) {
        objects.add(new Particle(loc));
      }
     
      
      
    }
    
    
    
    
  }
}
