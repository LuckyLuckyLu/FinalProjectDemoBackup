public class player extends entity{
  int bulletCount;
  public player(){
   bulletCount = 0;
   x = 400;
   y = 300;
   health = 10;
   bullets = new LinkedList();
   cooldown = 40;
  }
  
  public void update(){
    cooldown--;
    for(int i = 0;i < bullets.size();i++){
      bullet b = bullets.get(i);
      if(b.getX() < 0 || b.getX() > width || b.getY() < 0 || b.getY() > height){
        bullets.remove(b);
        i--;
      }else{
        for(int x = 0;x < enemies.size();x++){
          enemy e = enemies.get(x);
          if(pow((float)b.getX()-(float)e.getX(),2) + pow((float)b.getY()-(float)e.getY(),2) < 400){
              pleb.hit(e,b);
          }
        }
        b.update();
        b.display();
      }
    }
  }
  public int ammoShot(){
   return bulletCount; 
  }
  
  public void display(){
    fill(0);
    ellipse((int)x,(int)y,40,40);
  }
  
  void mouseShoot(int speed,int damage){
    float angle = atan2(mouseY-y,mouseX-x);
    bullets.add(new bullet(angle,speed,damage,x,y,0));
    bulletCount += 1;
  }
}
