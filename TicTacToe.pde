
Button[][] board;

int cols = 3;
int rows = 3;
int full = 9;
int game = 1;
int win = 0;

void setup() {
  size(500, 500);

  int w = width / cols;
  int h = height / rows;

  board = new Button[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Button(w * i, h * j, w, h);
    }
  }
}

void draw() {
  background(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      board[i][j].render();
    }
  }
}

void mousePressed()
{
  if(game == 1){
    if(win == 0){
      for(int i = 0; i < cols; i++){
        for(int j = 0; j < rows; j++){
          board[i][j].update();
        }
      }
    }
  }
}



/*if(board[i][j].isPressed() == true)
{
  ellipse(mouseX + board[i][j].Width/2, mouseY + board[i][j].Height/2, board[i][j].Width, board[i][j].Height);
}*/
