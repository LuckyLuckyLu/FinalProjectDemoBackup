import java.util.*;
public abstract class entity{
  int cooldown;
  float x,y;
  int health;
  color Color;
  double direction = 0;
  LinkedList<bullet> bullets;
  public int getHealth(){
    return health; 
  }
  public float getX(){
    return x; 
  }
  public float getY(){
    return y; 
  }
  public void addHealth(int amount){
    health += amount; 
  }
  public void resetBullets(){
    bullets = new LinkedList<bullet>();
  }
  
  public void moveDown(double amount){
    if(y + amount > 0 && y + amount < height){
      y += amount;
    }else{
      direction*=-1;
    }
  }
  public void moveRight(double amount){
    if(x + amount > 0 && x + amount < width){
      x += amount;
    }else{
      direction*=-1;
    }
  }
  
  void shoot(int speed,int damage){
    float angle = atan2(pleb.getY()-y,pleb.getX()-x);
    bullets.add(new bullet(angle,speed,damage,x,y,color(Color,0,0)));
  }
  
  void hit(entity e,bullet b){
    e.addHealth(-b.getDamage());
    bullets.remove(b);
  }
  
  color getColor(){
    return Color;
  }
}
