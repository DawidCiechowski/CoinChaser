import processing.sound.*;

SoundFile file;
String filePath;
String fileName = "Alan Walker - Faded.mp3";
float vol = 0.6;

//Player
Player player;

Modes mode;

Secrets secret;
//Game Status
boolean gameOver = false;
Levels level;

int speed;

int currentLevel = 0;
Boost b;

float secretTimer;
IntroScreen intro;
//Initial game setup
void setup() {
  size(600, 600);
  speed = 5;
  player = new Player(width/2, height/2);
  rectMode(CENTER);
  level = new Levels();
  intro = new IntroScreen();
  b = new Boost();
  b.boost = 100;
  mode = new Modes();
  textAlign(LEFT);
  secret = new Secrets();
  
  //Music
  filePath = sketchPath(fileName);
  file = new SoundFile(this, filePath);
  file.amp(vol);
  file.play();
  file.stop();
}

void draw() {
  background(0);
  stroke(255);
  line(0, 22, width, 22);
  
  if(currentLevel == 0) {
    intro.playButton();
    intro.exitButton();
  }
  
  if(gameOver == false && currentLevel != 0) {
    textAlign(LEFT);
    b.show();
    b.update();  
    
    level.t = level.interval - int(millis()/1000);
    level.time = nf(level.t, 3);
    level.removeCoins();
    
    for(int i = 0; i < level.coins.size(); i++) {
      level.coins.get(i).show();
    }
    
    b.revampBoost();
  
    if(mousePressed) {
       mode.modeNitro(player.nitroMode);
    }
    
    player.show();
    player.update();
    
     if(secret.aC == 3 && secret.dC == 3) {
    secretTimer = level.t - 1;
    secret.aC = 0;
    secret.dC = 0;
  }
  //println("a: " + secret.aC + " d: " + secret.dC + " abs: " + abs(secret.aC - secret.dC));
   //println(player.microMode + " " + player.alphaMode);
   if(secretTimer < level.t && secretTimer != 0) {
     secret.secret1();
   }
  }
  //println(boost);
  //println(level.spawner);
  //println(speed);

   if(currentLevel != 0) {
    if(level.coins.size() == 0 && level.t > 0) {
        level.changeLevel();
      } else if(level.coins.size() != 0 && level.t <= 0) {
        gameOver = true;
        level.time = "Game Over. (Press 'R' to restart)";
        level.interval = 0;
        vol = constrain(vol, 0.004, 1);
        vol -= 0.004;
        file.amp(vol);
        if(vol <= 0) {
          file.stop();
        }
      }
    //Print timer
      fill(255);
      textSize(11);
      text(level.time, 10, 10);
      text("Level: " + currentLevel, 10, 20);
  }
   mode.modeInfo();
}

//Initialize player
public void spawnPlayer() {
  player.x = width/2;
  player.y = height/2;
}


//Movement and restart mechanics
void keyPressed() {
  switch(key) {
    case 'w':
      player.dir(0, -speed);
      secret.aC = 0;
      secret.dC =0;
      break;
    case 's':
      player.dir(0, speed);
      secret.aC = 0;
      secret.dC = 0;
      break;
    case 'a':
      player.dir(-speed, 0);
      break;
    case 'd':
      player.dir(speed, 0);
      break;
    case 'r':
      level.restartGame();
      file.stop();
      file.loop();
      vol = 0.6;
      file.amp(vol);
      break;
    case 'z':
      if(player.alphaMode) {
        player.alphaMode = false;
      } else {
        player.alphaMode = true;
      }
      break;
    case 'x':
      if(player.nitroMode) {
        player.nitroMode = false;
        speed = 5;
      } else {
        player.nitroMode = true;
        speed = 15;
      }
      break;
    case 'c':
    if(player.microMode) {
      player.microMode = false;
    } else {
      player.microMode = true;
    }
  }
  
  if(key == 'a') {
    //println(abs(secret.dC - secret.aC));
    if(abs(secret.dC - secret.aC) > 1) {
      secret.aC = 1;
      secret.dC = 0;
    } else {
      secret.aC++;
    }
  }
  
  if(key == 'd') {
    if(abs(secret.dC-secret.aC) > 1){
      secret.dC = 1;
      secret.aC = 0;
    } else {
      secret.dC++;
    }
  }
}

void mouseReleased() {
    if(player.nitroMode) {
      speed = 15;
    } else {
      speed = 5;
    }
    
    if(currentLevel == 0 && intro.mouseIntersectsPlayButton()) {
      intro.playButtonClicked();
    } else if(currentLevel == 0 && intro.mouseIntersectsExitButton()) {
      System.exit(1);
    }
}
