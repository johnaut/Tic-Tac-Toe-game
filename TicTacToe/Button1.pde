
class Button1 {
  float x,y,w,h;
  char label;
  int state = 0;
  color c;
  boolean canBlock, canWin, canFork, canBlockFork = false;

  Button1(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.state = 0;
    c = color(255,255,255);
  }

  void display() {
    //stroke(5);
    strokeWeight(3);
    fill(c);
    rect(x, y, w, h);
    if(label == 'X')
      fill(255,0,0);
    else
      fill(0,0,255);
    textAlign(CENTER, CENTER);
    textSize(100);

    if(state==1){
      text(label, x + (w / 2), y + (h / 2));
      c = color(255,255,255);
    }

   if(canBlock == true && state == 0){
     c = color(255,160,122); //light red to denote blocking losing move
   }else if(canFork == true && state == 0){
     c = color(50,205,50); //light green to denote possible fork
   }else if(canWin == true && state == 0){
     c = color(50,205,50); //light green to denote winning move
   }else if(canBlockFork == true && state == 0){
     c = color(255,160,122); //light green to denote winning move
   }else{
     c = color(255);
   }
}
   boolean isInside (float mx, float my) {
     if (mx > x && mx < (x + w) && my > y && my < (y + h)) {
        return true;
      }
        return false;
  }

  boolean isAvailable(){
    boolean flag;
    if(state == 1)
      flag = false;
    else
      flag = true;

  return flag;
  }
}
