class zombie extends GameObject {

  float legRotateLeft = PI/6;
  float legRotateRight = -PI/6;
  float ArmRot = legRotateRight;

  PVector dir;
  float vx = cos(leftRightAngle), vy = 1, vz = sin(leftRightAngle);

  boolean left, right;
  boolean rotateArm, rotDown;

  zombie() {
    lives = 1;
    loc = new PVector(random(-2000, 1000), height-gridSize+20, random(-2000, 1000));

    left = true;
    right = true;

    if (mapGrid[(int)((loc.x+2000)/gridSize)][(int)((loc.z+2000)/gridSize)] != 0 && map.get((int)((loc.x+2000)/gridSize), (int)((loc.z+2000)/gridSize)) != white) {
      lives = 0;
    } else {
      mapGrid[(int)((loc.x+2000)/gridSize)][(int)((loc.z+2000)/gridSize)] = 3;
    }
  }



  void act() {
    vx = eyex - loc.x;
    vy = 0;
    vz = eyez - loc.z;
    dir = new PVector(vx, vy, vz);
    dir.setMag(5);  

    if (ArmRot >= PI/6) {
      rotDown = false;
    }
    if (ArmRot <= -PI/6) {
      rotDown = true;
    }
    if (rotDown) {
      ArmRot += 0.01;
    } else {
      ArmRot -= 0.01;
    }



    if (Math.abs(eyex - loc.x) < 200 && Math.abs(eyez - loc.z) < 200) {
      rotateArm = true;
      hearts--;
      hurt = true;
      return;
    } else {
      rotateArm = false;
    }

    if (mapGrid[Math.max((int)(loc.x+2000)/gridSize, 0)][Math.max((int)(loc.z+2000)/gridSize, 0)] == 3) {
      mapGrid[Math.max((int)(loc.x+2000)/gridSize, 0)][Math.max((int)(loc.z+2000)/gridSize, 0)] = 0;
    }


    if (mapGrid[Math.max((int)(loc.x+dir.x*0.05+2000)/gridSize, 0)][Math.max((int)(loc.z+dir.z*0.05+2000)/gridSize, 0)] == 0 && map.get((int)((loc.x+2000)/gridSize), (int)((loc.z+2000)/gridSize)) == white) { //&& (Math.max((int)(loc.x+dir.x)/gridSize,0) != Math.max((int)loc.x/gridSize,0) || Math.max((int)(loc.z + dir.z)/gridSize,0) != Math.max((int)loc.z/gridSize,0))
      loc.add(dir);
    } else if (mapGrid[Math.max((int)(loc.x+dir.x+2000)/gridSize, 0)][Math.max((int)(loc.z+dir.z+2000)/gridSize, 0)] == 0 &&  map.get((int)((loc.x+2000)/gridSize), (int)((loc.z+2000)/gridSize)) != white) {
      loc.add(dir);
    }
    
    if (mapGrid[Math.max((int)(loc.x+2000)/gridSize, 0)][Math.max((int)(loc.z+2000)/gridSize, 0)] == 0) {
      mapGrid[Math.max((int)(loc.x+2000)/gridSize, 0)][Math.max((int)(loc.z+2000)/gridSize, 0)] = 3;
    }



    if (legRotateLeft >= PI/6) {
      left = false;
    }
    if (legRotateLeft <= -PI/6) {
      left = true;
    }
    if (left) {
      legRotateLeft += 0.01;
    } else {
      legRotateLeft -= 0.01;
    }


    if (legRotateRight >= PI/6) {
      right = false;
    }
    if (legRotateRight <= -PI/6) {
      right = true;
    }
    if (right) {
      legRotateRight += 0.01;
    } else {
      legRotateRight -= 0.01;
    }
  }



  void show() {

    world.fill(255);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    if (eyex <= loc.x && eyez <= loc.z) {
      world.rotateY(atan((eyex-loc.x)/(eyez - loc.z)) + PI);
    }
    if (eyex >= loc.x && eyez <= loc.z) {
      world.rotateY(atan((eyex-loc.x)/(eyez - loc.z)) + PI);
    }
    if (eyex >= loc.x && eyez >= loc.z) {
      world.rotateY(atan((eyex-loc.x)/(eyez - loc.z)));
    }
    if (eyex <= loc.x && eyez >= loc.z) {
      world.rotateY(atan((eyex-loc.x)/(eyez - loc.z)));
    }

    world.pushMatrix();

    world.translate(5, -20, 0);
    world.rotateX(legRotateLeft);

    texturedCube(0, 0, 0, ZHeadB, ZHeadB, ZLegS, ZLegS, ZLegS, ZLegS, 30, 80, 30);
    world.translate(-5, 20, 0);


    //world.box(30, 80, 30); 
    world.popMatrix();

    world.pushMatrix();

    world.translate(-20, -20, 0);
    world.rotateX(legRotateRight);

    texturedCube(0, 0, 0, ZHeadB, ZHeadB, ZLegS, ZLegS, ZLegS, ZLegS, 30, 80, 30);
    world.translate(20, 20, 0);

    world.popMatrix();


    //HEAD
    //world.pushMatrix();
    //world.translate(loc.x-15, loc.y-170, loc.z);
    texturedCube(-15, -170, 0, ZHeadB, ZHeadB, ZHeadB, ZHeadB, ZHeadF, ZHeadB, 50, 50, 50);
    //world.popMatrix();


    //BODY
    //world.pushMatrix();
    //world.translate(loc.x-30, loc.y-120, loc.z);

    texturedCube(-30, -120, 0, ZBodyF, ZBodyF, ZBodyF, ZBodyF, ZBodyF, ZBodyB, 70, 100, 30);
    //world.box(70, 130, 30);
    //world.popMatrix();

    //ARM 1
    //world.pushMatrix();
    //world.translate(loc.x-60, loc.y-115, loc.z);

    if (rotateArm) {
      world.pushMatrix();

      world.translate(-60, -115, 0);
      world.rotateX(ArmRot);
      texturedCube(0, 0, 0, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, 30, 30, 100);


      //world.box(30, 30, 100);
      world.popMatrix();


      //ARM 2
      //world.pushMatrix();
      //world.translate(loc.x+40, loc.y-115, loc.z);

      world.pushMatrix();

      world.translate(40, -115, 0);
      world.rotateX(ArmRot);
      texturedCube(0, 0, 0, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, 30, 30, 100);
      //world.box(30, 30, 100);
      world.popMatrix();
    } else {

      world.pushMatrix();
      world.translate(-60, -115, 0);

      texturedCube(0, 0, 0, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, 30, 30, 100);


      //world.box(30, 30, 100);
      world.popMatrix();


      //ARM 2
      //world.pushMatrix();
      //world.translate(loc.x+40, loc.y-115, loc.z);

      world.pushMatrix();

      world.translate(40, -115, 0);

      texturedCube(0, 0, 0, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, ZArmF, 30, 30, 100);
      //world.box(30, 30, 100);
      world.popMatrix();
    }

    world.popMatrix();
  }
}
