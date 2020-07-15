class Levels {
  //Timer vars
  int t;
  int interval; 
  String time;
  ArrayList<Coins> coins = new ArrayList<Coins>();
  int spawner = 1;
  
  Levels(){
    time = "010";
  }
  
  void addCoins() {
    for(int i = 0; i < spawner; i++) {
      coins.add(new Coins((int)random(24, (width - 24)), (int)random(44, height - 24)));
    }
  }
  
  void spawnCoins() {
    for(int i = 0; i < spawner; i++) {
      coins.get(i).show();
    }
  }

  void restartGame() {
    coins.clear();
    levelOne();
    currentLevel = 1;
    b.boost = 100;
  }
  
  void removeCoins() {
    for(int i = 0; i< coins.size(); i++) {
      if(coins.get(i).intersects(player.x, player.y)) {
        coins.remove(coins.get(i));
      } else {
        coins.get(i).show();
      }
    }
  }
  
  void levelOne() {
    spawnPlayer();
    spawner = 1;
    addCoins();
    gameOver = false;
    interval = int(millis()/1000) + 100;
  }
  
  void levelTwo() {
    spawner = 1;
    addCoins();
    spawnPlayer();
    interval += 5 - t;
  }
  
  void levelThree() {
    spawner = 1;
    addCoins();
    spawnPlayer();
    interval += 30 - t;
  }
  
  void levelFour() {
    spawner = 14;
    addCoins();
    spawnPlayer();
    interval += 30 - t;
  }
  
  void levelFive() {
    spawner = 20;
    addCoins();
    spawnPlayer();
    interval += 30 - t;
  }
  
  void levelSix() {
    spawner = 100;
    addCoins();
    spawnPlayer();
    interval += 40 - t;
  }
  
  void changeLevel() {
    if(currentLevel == 0) {
      currentLevel =1;
      levelOne();
    } else if(currentLevel == 1) {
      currentLevel = 2;
      levelTwo();
    } else if(currentLevel == 2) {
      currentLevel = 3;
      levelThree();
    } else if(currentLevel == 3) {
      currentLevel = 4;
      levelFour();
    } else if(currentLevel == 4) {
      currentLevel = 5;
      levelFive();
    } else if(currentLevel == 5) {
      currentLevel = 6;
      levelSix();
    } else if (currentLevel == 6) {
      textSize(45);
      text("Congrats! You've won!", 50,300);
      gameOver = true;
      player.show();
      player.update();
    }
  }
}
