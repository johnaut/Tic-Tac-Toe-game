Cell[][] board;

int cols = 3;
int rows = 3;

void setup() {
  size(500, 500);

  int w = width / cols;
  int h = height / rows;

  board = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i * w, j * h, w, h);
    }
  }
}

void draw() {
  background(255);
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      board[i][j].display();
    }


    if(mousePressed)
    {

    }
  }
}

void mousePressed(){

}

// A Cell object
class Cell  {
  float x,y;
  float w,h;
  int state;

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH)  {
    this.x = tempX;
    this.y = tempY;
    this.w = tempW;
    this.h = tempH;
    this.state = 0;
  }

  void click(int mx, int my)  {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      state = (state + 1) % 3;
    }

  }

  void display()  {
    stroke(0);
    noFill();
    rect(x,y,w,h);

    int b = 8;

    if (state == 0) {
      // nothing
    } else if (state == 1) {
      // Draw an O
      ellipse(x+w/2,y+h/2,w-b,h-b);
    } else if (state == 2) {
      // Draw an X
      line(x+b,y+b,x+w-b,y+h-b);
      line(x+w-b,y+b,x+b,y+h-b);
    }
  }
}
