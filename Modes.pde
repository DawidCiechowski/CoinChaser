class Modes {
  
  Modes(){}
  
  void modeInfo() {
    if(player.alphaMode && player.nitroMode && player.microMode) {
      text("Nitro + Alpha + Micro Modes: On", 60, 20);
    } else if(player.alphaMode && player.nitroMode) {
      text("Nitro + Alpha Modes: On", 60, 20);
    } else if (player.alphaMode && player.microMode) {
      text("Alpha + Micro Modes: On", 60, 20);
    } else if(player.nitroMode && player.microMode) {
      text("Nitro + Micro Modes: On", 60, 20);
    } else if(player.nitroMode) {
      text("Nitro Mode: On", 60, 20);
    } else if(player.alphaMode) {
      text("Alpha Mode: On", 60, 20);
    } else if(player.microMode) {
      text("Micro Mode: On", 60, 20);
    }
  }
  
  public color modeAlpha(boolean am) {
    for(int i = 0; i < level.coins.size(); i++) {
      float d = dist(level.coins.get(i).x, level.coins.get(i).y, player.x, player.y);
      
      if(d < level.coins.get(i).r * 4 && am) {
        return color(255);
      } 
    }

    if(am) {
      return color(255, 0);
    } else {
      return(255);
    }
    
  }
  
  public void modeNitro(boolean nm) {
    b.boost = constrain(b.boost, 1, 100);
    if(nm) {
      b.boost -= 1;
      if(b.boost > 1) {
        speed = 20;
      } else {
        speed = 15;
      }
    } else {
      b.boost -= 1;
      if(b.boost > 1) {
        speed = 8;
      } else {
        speed = 5;
      }
    }
  }
  
  public int modeMicro(boolean mm) {
    if(mm) {
      return 10;
    } else {
      return 20;
    }
  }
  
}
