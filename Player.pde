class Player{
  PVector position;
  PVector accleration;
  float playerRadius;
  boolean collisionX;
  boolean collisionY;
//<------------------------------------------------------------->
  Player(PVector startPosition){
    position = startPosition;
    accleration = new PVector(0,0);
    playerRadius = 25;
    collisionX = false;
    collisionY = false;
  }
//<------------------------------------------------------------->
  void showPlayer1(){
    fill(255,0,0);
    ellipse(position.x,position.y,playerRadius*2,playerRadius*2);  
  }
//<------------------------------------------------------------->
  void showPlayer2(){
    fill(0,255,0);
    ellipse(position.x,position.y,playerRadius*2,playerRadius*2);  
  }
//<------------------------------------------------------------->
  void movePlayer(){
    if(!collisionX && !collisionY){
    accleration.limit(2);
    position.add(accleration);
    }
  }
//<------------------------------------------------------------->  
}
