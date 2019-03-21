import java.util.Random;
import javax.swing.JOptionPane;
Button1[][] board;

int cols = 3;
int rows = 3;
int game = 1;
int win = 0;
int player1;
int filled = 0;
int turns = 0;
int gameOver = 0;

void checkForWin(){
  int j = 0;

  for(int i=0;i<cols;i++){
    if(board[i][j].label == 'X' && board[i][j+1].label == 'X' && board[i][j+2].label == 'X')
      win = 1;//vertical X win
    else if(board[j][i].label == 'X' && board[j+1][i].label == 'X' && board[j+2][i].label == 'X')
      win = 1;//horizontal X win
    else if(board[i][j].label == 'O' && board[i][j+1].label == 'O' && board[i][j+2].label == 'O')
      win = 2;//vertical O win
    else if(board[j][i].label == 'O' && board[j+1][i].label == 'O' && board[j+2][i].label == 'O')
      win = 2;//horizontal O win
  }
  int diag = 0;//check diags
  if(board[diag][diag].label == 'X' && board[diag+1][diag+1].label == 'X' && board[diag+2][diag+2].label == 'X')
    win = 1;//Diag top left to bottom right X win
  else if(board[diag][diag].label == 'O' && board[diag+1][diag+1].label == 'O' && board[diag+2][diag+2].label == 'O')
    win = 2;//Diag top left to bottom right O win
  else if(board[diag][diag+2].label == 'X' && board[diag+1][diag+1].label == 'X' && board[diag+2][0].label == 'X')
    win = 2;//Diag top right to bottom left X win
  else if(board[diag][diag+2].label == 'O' && board[diag+1][diag+1].label == 'O' && board[diag+2][0].label == 'O')
    win = 2;//Diag top right to bottom left O win

}

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
  checkForWin();
}

void mousePressed()
{
    if(win == 0){
      for(int i = 0; i < cols; i++){
        for(int j = 0; j < rows; j++){
          if(board[i][j].isInside(mouseX,mouseY)){
              if(board[i][j].isAvailable()){
                if(player1 == 1){
                  board[i][j].label = 'X';
                  board[i][j].state = 1;
                }else{
                  board[i][j].label = 'O';
                  board[i][j].state = 1;
                }
                turns++;
                filled++;
            }
          }
        }
      }
    }
    checkForWin();
    computerMove();
    displayWinner();
}

/*Generates a random move made by the computer*/
void computerMove(){
  boolean cont = true;

  if(player1 == win)
    return;
  else
    filled++;
    turns++;
    
  do{
    Random ri = new Random();
    Random rj = new Random();

    int low = 0;
    int high = 3;

    int i = ri.nextInt(high-low) + low;
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
  }while(cont == true);
}

void displayWinner(){
  if(player1 == win)
      JOptionPane.showMessageDialog(null,"YOU WIN!");
  else if(player1 != win && win != 0)
      JOptionPane.showMessageDialog(null,"YOU LOSE!");
  else if(filled == 9 && win == 0)
      JOptionPane.showMessageDialog(null,"TIE!");

}
