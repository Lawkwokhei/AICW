class World{
  Controller player1;
  Controller player2;
  float worldWidth;
  float worldHeight;
  boolean player1BulletZeroX;
  boolean player1BulletZeroY;
  boolean player1BulletMaxX;
  boolean player1BulletMaxY;
  boolean player1BulletHit;
  boolean player2BulletZeroX;
  boolean player2BulletZeroY;
  boolean player2BulletMaxX;
  boolean player2BulletMaxY;
  boolean player2BulletHit;
  boolean gameFinish;
//<------------------------------------------------------------->  
  World(){
    player1 = new Controller(new PVector(width/2-300,height/10),15);
    player2 = new Controller(new PVector(width/2+300,height-200),-15);
    worldWidth = width;
    worldHeight = height;
    player1BulletZeroX = false;
    player1BulletZeroY = false;
    player1BulletMaxX = false;
    player1BulletMaxY = false;
    player1BulletHit = false;
    player2BulletZeroX = false;
    player2BulletZeroY = false;
    player2BulletMaxX = false;
    player2BulletMaxY = false;
    player2BulletHit = false;
    gameFinish = false;
}
//<------------------------------------------------------------->
//<-------------------------------------------------------------> 
  void showBoundaries(){
    fill(128,128,128);
    rect(0,0,worldWidth,1);
    rect(0,0,1,worldHeight);
    rect(0,worldHeight-1,worldWidth,1);
    rect(worldWidth-1,0,1,worldHeight);
    fill(0,0,255);
    rect(worldWidth/2,0,1,worldHeight);
  }
//<------------------------------------------------------------->
  void runGame(){
    this.showBoundaries();
    this.checkPlayer1Condition();
    this.checkPlayer2Condition();
    this.checkPlayerOneCollision();
    this.checkPlayerTwoCollision();
    this.showPlayers();
  }
//<------------------------------------------------------------->   
  void showPlayers(){
    if(player1.step <1000 && player2.step < 1000){
    player1.player.showPlayer1();
    player2.player.showPlayer2();
    player1.head.showHead();
    player2.head.showHead();
    player1.bullet.showBullet();
    player2.bullet.showBullet();
    player1.bullet.moveBullet();
    player2.bullet.moveBullet();
    player1.useFunction();
    player2.useFunction();
    //player1.keyReleased();
    //player2.keyReleased();
    }
    else{
      player1.score = 5;
      player2.score = 5;
      gameFinish = true;
    }
  }
//<-------------------------------------------------------------> 
  void checkPlayer1Condition(){
    player1.player.collisionX = player1.player.position.x + player1.player.accleration.x < 1 + player1.player.playerRadius  ||  player1.player.position.x + player1.player.accleration.x > worldWidth/2 - player1.player.playerRadius ;
    player1.player.collisionY = player1.player.position.y + player1.player.accleration.y < 1 + player1.player.playerRadius  ||  player1.player.position.y + player1.player.accleration.y > worldHeight - player1.player.playerRadius ;
    player1.head.bodyCollision = player1.player.collisionX || player1.player.collisionY;
    player1BulletZeroX = player1.bullet.position.x < 0 ;
    player1BulletZeroY = player1.bullet.position.y < 0 ;
    player1BulletMaxX = player1.bullet.position.x > worldWidth ;
    player1BulletMaxY = player1.bullet.position.y > worldHeight ;
    player1BulletHit = dist(player1.bullet.position.x,player1.bullet.position.y,player2.player.position.x,player2.player.position.y) < player1.bullet.bulletRadius + player2.player.playerRadius ;
  }
//<------------------------------------------------------------->   
  void checkPlayerOneCollision(){
    if(player1BulletZeroX|| player1BulletZeroY || player1BulletMaxX || player1BulletMaxY|| player1BulletHit){
      if(player1BulletHit){
        player1.score = 500000/player1.step;
        player2.score = player2.step/100;
      gameFinish = true;
      }
      else{
      player1.bullet.shot = true;
      //player1.bullet.setBullet(0,0);
      }
    }
  }
//<------------------------------------------------------------->   
  void checkPlayer2Condition(){
    player2.player.collisionX = player2.player.position.x + player2.player.accleration.x < width/2 + player2.player.playerRadius ||  player2.player.position.x + player2.player.accleration.x > worldWidth - player2.player.playerRadius ;
    player2.player.collisionY = player2.player.position.y + player2.player.accleration.y < 0 + player2.player.playerRadius ||  player2.player.position.y + player2.player.accleration.y > worldHeight - player2.player.playerRadius ;
    player2.head.bodyCollision = player2.player.collisionX || player2.player.collisionY;
    player2BulletZeroX = player2.bullet.position.x < 0 ;
    player2BulletZeroY = player2.bullet.position.y < 0 ;
    player2BulletMaxX = player2.bullet.position.x > worldWidth ;
    player2BulletMaxY = player2.bullet.position.y > worldHeight ;
    player2BulletHit = dist(player2.bullet.position.x,player2.bullet.position.y,player1.player.position.x,player1.player.position.y) < player2.bullet.bulletRadius + player1.player.playerRadius ;
  }
//<-------------------------------------------------------------> 
  void checkPlayerTwoCollision(){
    if(player2BulletZeroX|| player2BulletZeroY || player2BulletMaxX || player2BulletMaxY|| player2BulletHit){
      if(player2BulletHit){
        player2.score = 500000/player2.step;
        player1.score = player1.step/100;
        gameFinish = true;
      }
      player2.bullet.shot = true;
      player2.bullet.setBullet(0,0);
    }
  }
//<------------------------------------------------------------->
  void caculateFitnessForPlayers(){
    player1.calculateFitness();
    player2.calculateFitness();
    println("player1 :" + player1.fitness);
    println("player2 :" + player2.fitness);
  }
//<------------------------------------------------------------->
  void randomizeController(){
    player1.randomize();
    player2.randomize();
  }
//<------------------------------------------------------------->  

}
