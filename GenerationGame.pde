class GenerationGame{
  World[] worlds;
  Controller[] player1Controller;
  Controller[] player2Controller;
  int gamesCount = 0;
  int generation = 1;
  float fitnessSum = 0;
  float fitnessCheck = 0;
  Controller parentA,parentB;
  float parentAFitness = 0;
//<-------------------------------------------------------------->
  GenerationGame(int size){
    worlds = new World[size];
    player1Controller = new Controller[size];
    player2Controller = new Controller[size];
    for(int i=0;i<size;i++){
      worlds[i] = new World();
    }
  }
//<-------------------------------------------------------------->
  void runGenerationGame(){
      if(!worlds[gamesCount].gameFinish && gamesCount < worlds.length){
        if(generation ==1){
          worlds[gamesCount].randomizeController();
        }
        worlds[gamesCount].runGame();
      }
      else if(gamesCount < worlds.length){
        worlds[gamesCount].caculateFitnessForPlayers();
        player1Controller[gamesCount] = worlds[gamesCount].player1;
        player2Controller[gamesCount] = worlds[gamesCount].player1;
        this.nextGame();
      }
      else{
        generation++;
        this.selectParents(player1Controller);
        this.selectParents(player2Controller);
      }
  }
//<-------------------------------------------------------------->
  void nextGame(){
    gamesCount++;
  }
//<-------------------------------------------------------------->
  void selectParents(Controller[] controllerPool){
    for(int i =0;i < controllerPool.length;i++){
      fitnessSum += controllerPool[i].fitness;
    }
    float randomSelect =random(0,fitnessSum);
    for(int i = 0;i < controllerPool.length;i++){
      fitnessCheck += controllerPool[i].fitness;
      if(randomSelect < fitnessCheck){
        parentA = controllerPool[i];
        parentAFitness = controllerPool[i].fitness;
        controllerPool[i].fitness = 0;
        break;
      }
    }
    randomSelect = random(0,fitnessSum -parentAFitness);
    resetFitnessCheck();
    for(int i = 0;i < controllerPool.length;i++){
      fitnessCheck += controllerPool[i].fitness;
      if(randomSelect < fitnessCheck){
        parentB = controllerPool[i];
        break;
      }
    }
  }
//<-------------------------------------------------------------->
  void resetFitnessCheck(){
    fitnessCheck = 0;
  }
//<-------------------------------------------------------------->
  void crossOver(){
    
  }
//<-------------------------------------------------------------->

}
