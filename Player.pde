class Player {
  boolean alphaMode = false;
  boolean nitroMode = false;
  boolean microMode = false;
  
  Modes mode = new Modes();
  int x, y, h, w;
  int xDir, yDir;
  Player(int x, int y) {
    this.x = x; 
    this.y = y;
    if(microMode) {
      h = 10;
      w = 10;
    } else {
      h = 20;
      w = 20;
    }
    xDir = 0;
    yDir = speed;
  }
  
  void show() {
    rectMode(CENTER);
    fill(mode.modeAlpha(alphaMode));
    int wh = mode.modeMicro(microMode);
    x = constrain(x, wh/2, width - (wh/2));
    y = constrain(y, wh/2 + 22, height - (wh/2));
    rect(x, y, wh, wh);
  }
  
  void dir(int xMovement, int yMovement) {
    xDir = xMovement;
    yDir = yMovement;
  }
  
  void update() {
    x += xDir;
    y += yDir;
  }
      
}
