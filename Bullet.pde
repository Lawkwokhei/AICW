class Bullet{
  PVector position;
  PVector velocity;
  boolean shot;
  float bulletRadius;
//<------------------------------------------------------------->  
  Bullet(){
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    shot = true;
    bulletRadius = 5/2;
  }
//<------------------------------------------------------------->  
  void setBullet(float x,float y){
    position.x = x;
    position.y = y;
  }
//<------------------------------------------------------------->  
  void setVelocity(float x,float y){
    velocity.x = x;
    velocity.y = y;
  }
//<------------------------------------------------------------->  
  void showBullet(){
    fill(100,100,0);
    ellipse(position.x,position.y,bulletRadius*2,bulletRadius*2);
  }
//<------------------------------------------------------------->  
  void moveBullet(){
    velocity.limit(5);
    position.add(velocity);
  }
//<------------------------------------------------------------->  
}
