
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
    //stroke(5);
    strokeWeight(3);
    fill(255);
    rect(x, y, w, h);
    if(label == 'X')
      fill(255,0,0);
    else
      fill(0,0,255);
    textAlign(CENTER, CENTER);
    textSize(100);

    if(state==1){
    text(label, x + (w / 2), y + (h / 2));
    }
  }

  void displayHint() {
    rect(x,y,w,h);
    fill(75);
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
