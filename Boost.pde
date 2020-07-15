class Boost {
  float boostMeter;
  float greenValue = 255;
  float boost = 100;
  Boost(){
  }
  
  void show() {
    rectMode(CORNER);
    
    noFill();
    stroke(255);
    rect(344, 9, 251, 11);
    
    noStroke();
    fill(125, (int)greenValue, 0);
    rect(345, 10, boostMeter, 10);
    
    fill(255);
    text("Boost: ", 300, 20);
  }
  
  void update() {
    boostMeter = map(boost, 0, 100, 0, 250);
    greenValue = map(boost, 0, 100, 0, 255);
  }
  
 void revampBoost() {
  boost = constrain(boost, 1, 100);
  boost += 0.5;
 }
    
  
  
      
}
