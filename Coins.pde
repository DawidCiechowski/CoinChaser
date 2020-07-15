class Coins {
  int x, y, r;
  
  Coins(int x, int y) {
    this.x = x;
    this.y = y;
    r = 12;
  }

  
  void show() {
    fill(250-250-210);
    noStroke();
    ellipse(x, y, r, r);
  }
  
  boolean intersects(int PlayerX, int PlayerY) {
    float d = dist(x, y, PlayerX, PlayerY);
    if(d < r + (r/2)) {
      return true;
    } else {
      return false;
    }
  }

} 
