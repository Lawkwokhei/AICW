class PlayerHead{
  PVector playerPosition;
  float degree;
  float playerHead;
  PVector accleration;
  PVector headPosition;
  boolean bodyCollision;
//<------------------------------------------------------------->  
  PlayerHead(PVector position,float head){
    playerHead = head;
    playerPosition = new PVector(position.x,position.y);
    accleration = new PVector(0,0);
    bodyCollision = false;
  }
//<------------------------------------------------------------->  
  void showHead(){
    pushMatrix();
    translate(playerPosition.x,playerPosition.y);
    rotate(degrees(degree));
    fill(0);
    ellipse(playerHead,0,10,10);
    popMatrix();   
  }
//<------------------------------------------------------------->  
  void updateDirectionRight(){
    degree = degree+0.1;
  }
//<------------------------------------------------------------->  
  void updateDirectionLeft(){
    degree = degree-0.1;
  }
//<------------------------------------------------------------->  
  void movePlayerHead(){
    if(!bodyCollision){
    accleration.limit(2);
    playerPosition.add(accleration);
    }
  }
//<------------------------------------------------------------->
  PVector headPosition(){
    headPosition = new PVector(playerHead,0);
    headPosition.rotate(degrees(degree));
    return headPosition;
  }
//<------------------------------------------------------------->  
  PVector reverseHeadPosition(){
    headPosition = new PVector(playerHead,0);
    headPosition.rotate(degrees(degree));
    return new PVector(-headPosition.x,-headPosition.y);
  }
}
