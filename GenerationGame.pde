class GenerationGame{
  World[] worlds;
  Controller[] player1Controller;
  float[][] player1Action;
  float[][] player2Action;
  Controller[] player2Controller;
  int gamesCount = 0;
  int generation = 1;
  float fitnessSum = 0;
  float fitnessCheck = 0;
  Controller parentA,parentB;
  float[] childA,childB;
  float parentAFitness = 0;
//<-------------------------------------------------------------->
  GenerationGame(int size){
    worlds = new World[size];
    player1Controller = new Controller[size];
    player2Controller = new Controller[size];
    player1Action = new float[size][1000];
    player2Action = new float[size][1000];
    childA = new float[1000];
    childB = new float[1000];
    for(int i=0;i<size;i++){
      worlds[i] = new World();
    }
  }
//<-------------------------------------------------------------->
  void runGenerationGame(){
      if(gamesCount < worlds.length &&!worlds[gamesCount].gameFinish){
        if(generation ==1){
          worlds[gamesCount].randomizeController();
        }
        else if(generation !=1){
          worlds[gamesCount].player1.setActions(player1Action[gamesCount]);
          worlds[gamesCount].player2.setActions(player2Action[gamesCount]);
        }
        worlds[gamesCount].runGame();
      }
      else if(gamesCount < worlds.length){
        println("Generation: "+ generation);
        println("Game: "+ gamesCount);
        worlds[gamesCount].caculateFitnessForPlayers();
        player1Controller[gamesCount] = worlds[gamesCount].player1;
        player2Controller[gamesCount] = worlds[gamesCount].player2;
        this.nextGame();
      }
      else{
        generation++;
        gamesCount = 0;
        this.selectParents(player1Controller);
        this.createBabyController(player1Action);
        this.mutateBaby(player1Action);
        this.selectParents(player2Controller);
        this.createBabyController(player2Action); 
        this.mutateBaby(player2Action);
        this.resetWorld();
      }
  }
//<-------------------------------------------------------------->
  void mutateBaby(float[][] actions){
    float mutationRate = 0.01;
    for(int i = 0;i<actions.length;i++){
    float mutationChance = random(0,1);
    if(mutationChance < mutationRate){
      println("Mutation!");
      for(int k =0;k<actions[i].length;k++){
        float randomFloat = random(0,100);
        actions[i][k] = randomFloat;
      }
    }
    }
  }
//<-------------------------------------------------------------->
  void createBabyController(float[][] actions){
    actions[0] = parentA.action;
    actions[1] = parentB.action;
    for(int i = 2;i<10;i+=2){
      crossOver(parentA,parentB);
      actions[i] = childA;
      actions[i+1] = childB;
    }
  }
//<-------------------------------------------------------------->
  void nextGame(){
    gamesCount++;
  }
//<-------------------------------------------------------------->
  void selectParents(Controller[] controllerPool){
    fitnessSum=0;
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
  void crossOver(Controller a, Controller b){
    childA = new float[childA.length];
    childB = new float[childA.length];
    if(a.action.length != b.action.length){
      println("CrossOverError:Different actions length parents");
    }
    else{
      int randomCrossOverPoint = round(random(0,a.action.length));
      println(randomCrossOverPoint);
      for(int i = 0; i<a.action.length;i++){
        if(i < randomCrossOverPoint){
          childA[i] = a.action[i];
          childB[i] = b.action[i];
        }
        else{
          childA[i] = b.action[i];
          childB[i] = a.action[i];
        }
      }
    }
  }
//<-------------------------------------------------------------->
  void resetWorld(){
    for(int i = 0;i<worlds.length;i++){
      worlds[i] = new World();
    }
  }
}
