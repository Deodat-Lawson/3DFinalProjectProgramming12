import java.awt.Robot;

color black = #000000, white = #FFFFFF, blue = #7092BE;

float eyex, eyey, eyez; // 

float focusx, focusy, focusz; //pointing to
float upx, upy, upz;

float leftRightAngle, upDownAngle;

boolean akey, wkey, skey, dkey, spaceKey, jump;
int jumpTime, jumpB, jumpThres;

PImage introLogo, home;
int thres = 0;


Button startButton, pauseButton, playAgain;
Robot d;
//textures
PImage mossyStone, ground, wood, empty, ground2, netherrack;

//initialize map
PImage map;
short[][] mapGrid;

int gridSize;

//Game Objects
ArrayList<GameObject> objects, zombies;

//canvass
PGraphics world;
PGraphics HUD;


ArrayList<PImage> s;
ArrayList<PImage> back;

int N;


PImage ZHeadF, ZHeadB, ZLegS, ZBodyS, ZBodyF, ZBodyB, ZArmF;



final int START = 0, GAME = 1, PAUSE = 2, END = 3, HOME = 4;
int gameM;

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);

  gameM = START;


  jumpTime = 0;
  jumpB = 0;
  jumpThres = 0;

  objects = new ArrayList<GameObject>();
  zombies = new ArrayList<GameObject>();

  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);

  try {
    d = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  world.textureMode(NORMAL);
  size(displayWidth, displayHeight, P2D);

  eyex = width/2;
  eyey = 0.8*height;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2-100;

  upx = 0;
  upy = 1;
  upz = 0;

  leftRightAngle = 0;
  upDownAngle = 0;

  map = loadImage("map.png");
  mossyStone = loadImage("mossyStone.png");
  ground = loadImage("gold.png");
  ground2 = loadImage("diamond.png");
  wood = loadImage("oakPlank.png");
  empty = loadImage("png.png");
  netherrack = loadImage("netherrack.png");
  introLogo = loadImage("Logo.png");
  home = loadImage("home.jpg");

  world.textureMode(NORMAL);
  gridSize = 100;

  s = new ArrayList<PImage>();
  back = new ArrayList<PImage>();



  mapGrid = new short[map.width+1][map.height+1];
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);

      if (c == blue) {
        mapGrid[x][y] = 1;
      } else if ( c == black) {
        mapGrid[x][y] = 2;
      } else if ( c == #5500FF) {
        mapGrid[x][y] = 6;
      }
    }
  }

  for (int i = 0; i < 32; i++) {
    s.add(loadImage("00"+i+".png"));
  }

  for (int i = 0; i < 18; i++) {
    back.add(loadImage("000"+i+".png"));
  }

  for (int i = 0; i < 3; i++) {
    objects.add(new Spiral());
    zombies.add(new zombie());
  }



  N = 0;



  ZHeadF = loadImage("ZombieHF.PNG");
  ZHeadB = loadImage("ZombieHS.PNG"); 
  ZLegS = loadImage("ZombieLS.PNG");
  ZBodyF = loadImage("ZombieBF.PNG");
  ZBodyB = loadImage("ZombieBB.PNG");
  ZBodyS = loadImage("ZombieBS.PNG");
  ZArmF = loadImage("ZombieA.PNG");



  startButton = new Button(width/2, height/2, 200, 100, color(255), color(255, 0, 0), "Start", 30, false);
  playAgain = new Button(width/2, height/2,200,100,color(255),color(0,255,0),"Play Again",20,false);
  pauseButton = new Button(width-50, 50, 50, 50, color(255), color (255, 0, 0), "||", 20, false);
}

void draw() {
  if (gameM == START) {
    starts();
  } else if (gameM == HOME) {
    home();
  } else if (gameM == GAME) {
    rectMode(LEFT);
    imageMode(CORNER);
    textAlign(LEFT);

    game();
  }
  else if (gameM == PAUSE) {
    pause();
  }
  else if(gameM == END){
   end(); 
  }
}





void drawAxes() {
  //line(x1,y1,z1,x2,y2,z2)
}

void drawFloor(int start, int end, int level, int gap) {
  world.stroke(255);
  world.strokeWeight(1);

  int x = start;
  while ((x+=gap) <= end) {
    world.line(x, level, end, x, level, start);
    world.line(end, level, x, start, level, x);
  }
}





void drawMap() {

  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c != white) {
        if (c == blue) {
          texturedCube(x*gridSize - 2000, height-gridSize, y*gridSize -2000, mossyStone, mossyStone, mossyStone, mossyStone, mossyStone, mossyStone, gridSize, gridSize, gridSize);
          texturedCube(x*gridSize - 2000, height-2*gridSize, y*gridSize -2000, mossyStone, mossyStone, mossyStone, mossyStone, mossyStone, mossyStone, gridSize, gridSize, gridSize);
          texturedCube(x*gridSize - 2000, height-3*gridSize, y*gridSize -2000, mossyStone, mossyStone, mossyStone, mossyStone, mossyStone, mossyStone, gridSize, gridSize, gridSize);
        } else if ( c == black) {
          texturedCube(x*gridSize - 2000, height-gridSize, y*gridSize -2000, wood, wood, wood, wood, wood, wood, gridSize, gridSize, gridSize);
          texturedCube(x*gridSize - 2000, height-2*gridSize, y*gridSize -2000, wood, wood, wood, wood, wood, wood, gridSize, gridSize, gridSize);
          texturedCube(x*gridSize - 2000, height-3*gridSize, y*gridSize -2000, wood, wood, wood, wood, wood, wood, gridSize, gridSize, gridSize);
        } else if ( c == #5500FF) {
          texturedCube(x*gridSize - 2000, height-gridSize, y*gridSize -2000, netherrack, netherrack, netherrack, netherrack, netherrack, netherrack, gridSize, gridSize, gridSize);
          texturedCube(x*gridSize - 2000, height-2*gridSize, y*gridSize -2000, netherrack, netherrack, netherrack, netherrack, netherrack, netherrack, gridSize, gridSize, gridSize);
          texturedCube(x*gridSize - 2000, height-3*gridSize, y*gridSize -2000, netherrack, netherrack, netherrack, netherrack, netherrack, netherrack, gridSize, gridSize, gridSize);
        }
      } 
      if ((x+y)%2 == 0) {
        texturedCube(x*gridSize - 2000, height, y*gridSize -2000, ground, ground, ground, ground, ground, ground, gridSize, gridSize, gridSize);
      } else {
        texturedCube(x*gridSize - 2000, height, y*gridSize -2000, ground2, ground2, ground2, ground2, ground2, ground2, gridSize, gridSize, gridSize);
      }
    }
  }
}
