//World gameWorld;
//Controller test1,test2;
GenerationGame test;
//<------------------------------------------------------------->
void setup(){
  size(800,800);
  //gameWorld = new World();
  test = new GenerationGame(10);
  //frameRate(60);
  
  //test1 = new Controller(new PVector(width/2,height/2));
  //test2 = new Controller(new PVector(width/4,height/4));

}
//<------------------------------------------------------------->
void draw(){
  background(255);
  //test1.keyReleased();
  //test2.keyReleased();
  //gameWorld.showBoundaries();
  //gameWorld.showPlayers();
  //gameWorld.checkPlayer1Condition();
  //gameWorld.checkPlayer2Condition();
  //gameWorld.checkPlayerOneCollision();
  //gameWorld.checkPlayerTwoCollision();
  //gameWorld.runGame();
  test.runGenerationGame();
}
