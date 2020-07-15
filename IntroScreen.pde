public class IntroScreen {
  
  IntroScreen(){};
  
  void playButton() {
    textAlign(CENTER, CENTER);
    noFill();
    stroke(255);
    rectMode(CORNER);
    rect(225, 275, 150, 50);
    fill(255);
    text("PLAY", 300, 300);
  }
  
  void exitButton() {
    noFill();
    rectMode(CORNER);
    rect(225, 335, 150, 50);
    fill(255);
    text("EXIT", 300, 360);
  }
  
  public boolean mouseIntersectsPlayButton() {
    if(mouseX > 225 && mouseX < 375 && mouseY >275 && mouseY < 325){
       return true;
    }
    return false;
  }
  
  public boolean mouseIntersectsExitButton() {
    if(mouseX > 225 && mouseX < 375 && mouseY >335 && mouseY < 385){
         return true;
      }
    return false;  
  }
  
  public void playButtonClicked() {
    level.changeLevel();
    file.loop();
  }
  
}
