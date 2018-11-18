class Player{
  PVector position;
  PVector accleration;
  PVector velocity;
  float playerRadius;
  boolean collisionX;
  boolean collisionY;
//<------------------------------------------------------------->
  Player(PVector startPosition){
    position = startPosition;
    accleration = new PVector(0,0);
    velocity = new PVector(0,0);
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
    //this.collisionX = this.position.x + accleration.x < 1 + playerRadius  ||  position.x + accleration.x > width/2- playerRadius ;
    //this.collisionY = this.position.y + accleration.y < 1 + playerRadius  ||  position.y + accleration.y > height/2 - playerRadius ;
    if(!collisionX && !collisionY){
    accleration.limit(5);
    velocity.limit(5);
    velocity.add(accleration);
    position.add(velocity);
    }
  }
//<------------------------------------------------------------->  
}
