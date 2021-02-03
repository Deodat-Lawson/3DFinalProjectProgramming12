void texturedCube(float x, float y, float z, PImage top, PImage bottom, PImage left, PImage right, PImage front, PImage back, float sizeX,float sizeY, float sizeZ) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(sizeX);
  world.noStroke();
  
  float diffY = sizeY/sizeX;
  float diffZ = sizeZ/sizeX;

  world.beginShape(QUADS);
  world.texture(top);

  //top
  //     x,y,z,tx,ty
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, diffZ, 1, diffZ);
  world.vertex(0, 0, diffZ, 0, diffZ);
  world.endShape();

  //bottom
  world.beginShape(QUADS);
  world.texture(bottom);
  world.vertex(0, diffY, 0, 0, 0);
  world.vertex(1, diffY, 0, 1, 0);
  world.vertex(1, diffY, diffZ, 1, diffZ);
  world.vertex(0, diffY, diffZ, 0, diffZ);
  world.endShape();

  world.beginShape(QUADS);
  world.texture(front);

  //front
  world.vertex(0, 0, diffZ, 0, 0);
  world.vertex(1, 0, diffZ, 1, 0);
  world.vertex(1, diffY, diffZ, 1, diffZ);
  world.vertex(0, diffY, diffZ, 0, diffZ);
  world.endShape();


  world.beginShape(QUADS);
  world.texture(back);
  //back
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, diffY, 0, 1, diffZ);
  world.vertex(0, diffY, 0, 0, diffZ);
  world.endShape();

  world.beginShape(QUADS);
  world.texture(left);
  //left
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, diffZ, diffY, 0);
  world.vertex(0, diffY, diffZ, diffY, diffZ);
  world.vertex(0, diffY, 0, 0, diffZ);
  world.endShape();

  world.beginShape(QUADS);
  world.texture(right);
  //right
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(1, 0, diffZ,diffY , 0);
  world.vertex(1, diffY, diffZ, diffY, diffZ);
  world.vertex(1, diffY, 0, 0, diffZ);

  world.endShape();
  world.popMatrix();
}
