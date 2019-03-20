import java.util.Random;
Button1[][] board;

int cols = 3;
int rows = 3;
int full = 9;
int game = 1;
int win = 0;
int player1;

int turns = 0;

void setup() {
  size(500, 500);

  int w = width / cols;
  int h = height / rows;

  board = new Button1[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Button1(w * i, h * j, w, h);
    }
  }

   player1 = (Math.random() <= 0.5) ? 1 : 2;

   if(player1 == 2){
     computerMove();
   }
}

void draw() {
  background(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      board[i][j].display();
    }
  }


}

void mousePressed()
{
  if(game == 1){
    if(win == 0){
      for(int i = 0; i < cols; i++){
        for(int j = 0; j < rows; j++){
          if(board[i][j].isInside(mouseX,mouseY)){
              if(board[i][j].isAvailable()){
                if(player1 == 1){
                  board[i][j].state = 1;
                  board[i][j].label = 'X';
              }else{
                board[i][j].state = 1;
                board[i][j].label = 'O';
          }
          turns++;
        }
      }
    }
  }

  if(turns < 5){
     computerMove();
  }




}
  }
}


void computerMove(){

  boolean cont = true;

  do{
  Random ri = new Random();
  int low = 0;
  int high = 3;
  int i = ri.nextInt(high-low) + low;
  Random rj = new Random();
  int j = rj.nextInt(high-low) + low;

  if(board[i][j].isAvailable()){
    board[i][j].state = 1;
    if(player1 == 1){
       board[i][j].label = 'O';
  }else{
      board[i][j].label = 'X';
  }
   cont = false;
  }

  }while(cont);
}
