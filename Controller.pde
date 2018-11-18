class Controller{
  Player player;
  PlayerHead head;
  Bullet bullet;
  PVector directions;
  int step = 0;
  float[] action;
  float fitness = 0;
  float shotTimes = 0;
  float score;
//<------------------------------------------------------------->
  Controller(PVector playerPosition,float headPosition){
    player = new Player(playerPosition);
    head = new PlayerHead(playerPosition,headPosition);
    bullet = new Bullet();
    action = new float[1000];
}
//<------------------------------------------------------------->
  void randomize(){
    for(int i =0; i < action.length;i++){
      float randomFloat = random(0,100);
    action[i] = randomFloat;
    }
  }
//<------------------------------------------------------------->
  void setActions(float[] newActions){
    action = newActions;
  }
//<------------------------------------------------------------->
  void useFunction(){
    if(action[step]<=20){
      turnLeft();
      step++;
    }
    else if(action[step]<=40 && action[step] >20){
      turnRight();
      step++;
    }
    else if(action[step]<=60 && action[step] >40){
      goForward();
      step++;
    }
    else if(action[step]<=80 && action[step] >60){
      goBackward();
      step++;
    }
    else if(action[step]<=100 && action[step] >80){
      shoot();
      step++;
    }
    
  }
//<------------------------------------------------------------->
  void turnLeft(){
    head.updateDirectionLeft();
  }
//<------------------------------------------------------------->
  void turnRight(){
    head.updateDirectionRight();
  }
//<------------------------------------------------------------->
  void shoot(){
    if(bullet.shot){
    bullet.setBullet(player.position.x,player.position.y);
    bullet.setVelocity(head.headPosition().x,head.headPosition().y);
    bullet.shot = false;
    shotTimes++;
    }
}
//<------------------------------------------------------------->
  void goForward(){
    player.accleration = head.headPosition();
    head.accleration = head.headPosition();
    //head.movePlayerHead();
    //player.movePlayer();
  }
//<------------------------------------------------------------->
  void goBackward(){
    player.accleration = head.reverseHeadPosition();
    head.accleration = head.reverseHeadPosition();
    //head.movePlayerHead();
    //player.movePlayer();
  }
//<------------------------------------------------------------->
  void calculateFitness(){
    fitness = (1001-step)/100 + 10/shotTimes + score;
  }
//<------------------------------------------------------------->
  void keyReleased(){
    if(keyPressed == true){
    if(key == 'a'){
      turnRight();
    }
    if(key == 'd'){
      turnLeft();
    }
    if(key == 'w'){   
      goForward();
    }
    if(key == 's'){
      goBackward();
    }
    if(key == ' '){
      shoot();
    }
    }
  }
}

//<------------------------------------------------------------->  
