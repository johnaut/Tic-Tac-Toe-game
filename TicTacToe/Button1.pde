
class Button1 {
  
  float x;
  float y; 
  float w;
  float h;
  char label;
  int state = 0; 
  
  
  Button1(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.state = 0;
    
  }
  
   void display() {
    stroke(0);
    fill(255);  
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    
    if(state==1){
    text(label, x + (w / 2), y + (h / 2));
    }
    
  }
  
  
boolean isInside (float mx, float my) {
   if (mx > x && mx < (x + w) && my > y && my < (y + h)) {
      return true;
    }
    return false;
  }
  
boolean isAvailable(){
  if(state == 1)
    return false;
return true;
}
}
  
  
