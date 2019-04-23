import java.util.Random;
import javax.swing.*;
import processing.sound.*;

SoundFile file;
Button1[][] board;
Hint helper;
int cols = 3;
int rows = 3;
int win, filled, turns, player1;
boolean gameOver = false;
char compMarker = ' ';
char playerMarker = ' ';
boolean next = true; //flag that makes computer check for next possible move

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
    win = 1;//Diag top right to bottom left X win
  else if(board[diag][diag+2].label == 'O' && board[diag+1][diag+1].label == 'O' && board[diag+2][0].label == 'O')
    win = 2;//Diag top right to bottom left O win

}

 Button1 nextTurnWin(char marker){
  Button1 nextMove = board[0][0];

  int j = 0;

  for(int i=0;i<cols;i++){
    if(board[i][j].isAvailable()   && board[i][j+1].label == marker && board[i][j+2].label == marker){
      nextMove = board[i][j];
      next = false;
    }else if(board[i][j].label == marker && board[i][j+1].isAvailable()   && board[i][j+2].label == marker){
      nextMove = board[i][j+1];
      next = false;
    }else if(board[i][j].label == marker && board[i][j+1].label == marker && board[i][j+2].isAvailable()  ){
      nextMove = board[i][j+2];
      next = false;
    }else if(board[j][i].isAvailable()   && board[j+1][i].label == marker && board[j+2][i].label == marker){
      nextMove = board[j][i];
      next = false;
    }else if(board[j][i].label == marker && board[j+1][i].isAvailable()   && board[j+2][i].label == marker){
      nextMove = board[j+1][i];
      next = false;
    }else if(board[j][i].label == marker && board[j+1][i].label == marker && board[j+2][i].isAvailable()  ){
      nextMove = board[j+2][i];
      next = false;
    }
  }
  int diag = 0;//check diags
  if(board[diag][diag].isAvailable()   && board[diag+1][diag+1].label == marker && board[diag+2][diag+2].label == marker){
    nextMove = board[diag][diag];
    next = false;
  }else if(board[diag][diag].label == marker && board[diag+1][diag+1].isAvailable()   && board[diag+2][diag+2].label == marker){
    nextMove = board[diag+1][diag+1];
    next = false;
  }else if(board[diag][diag].label == marker && board[diag+1][diag+1].label == marker && board[diag+2][diag+2].isAvailable()  ){
    nextMove = board[diag+2][diag+2];
    next = false;
  }else if(board[diag][diag+2].isAvailable()   && board[diag+1][diag+1].label == marker && board[diag+2][0].label == marker){
    nextMove = board[diag][diag+2];
    next = false;
  }else if(board[diag][diag+2].label == marker && board[diag+1][diag+1].isAvailable()   && board[diag+2][0].label == marker){
    nextMove = board[diag+1][diag+1];
    next = false;
  }else if(board[diag][diag+2].label == marker && board[diag+1][diag+1].label == marker && board[diag+2][0].isAvailable()){
    nextMove = board[diag+2][0];
    next = false;
  }
  return nextMove;
}

 Button1 stopFork(char marker){
  Button1 nextMove = board[0][0];
  if(turns == 2){
    if(board[0][0].label == marker && board[2][2].label == marker || board[0][2].label == marker && board[2][0].label == marker){
      nextMove = board[1][2];
      next = false;
    }
  }
  return nextMove;
}

 Button1 createFork(char marker){
  Button1 nextMove = board[0][0];
  int cornerNum = 4;
  Button1 corners [] = {board[0][0], board[0][2], board[2][0], board[2][2]};
  if(compMarker == 'X'){
    if(filled == 2){
      if(board[0][0].label == marker && board[2][2].isAvailable()){
        nextMove = board[2][2];
        next = false;
      }
      else if(board[0][2].label == marker && board[2][0].isAvailable()){
        nextMove = board[2][0];
        next = false;
      }
      else if(board[2][0].label == marker && board[0][2].isAvailable()){
        nextMove = board[0][2];
        next = false;
      }
      else if(board[2][2].label == marker && board[0][0].isAvailable()){
        nextMove = board[0][0];
        next = false;
      }
      else{
        for(int i = 0; i< cornerNum; i++){
          if(corners[i].isAvailable()){
            nextMove = corners[i];
            next = false;
            break;
          }
        }
      }
    }
  }
  return nextMove;
}

void setup() {
  size(1200, 600);
  filled = 0;
  turns = 0;
  win = 0;

  int w = 600;
  int h = 600;

  board = new Button1[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Button1(w * i/3, h * j/3, w/3, h/3);
    }
  }
  assignMarker();
  helper = new Hint(playerMarker, board);
}

void assignMarker(){
  player1 = (Math.random() <= 0.5) ? 1 : 2;
  if(player1 == 1){
    print("you are X\n");
    playerMarker = 'X';
    compMarker = 'O';
  }
  else{
     print("you are O\n");
     playerMarker = 'O';
     compMarker = 'X';
   }
   if(player1 == 2){
     computerMove();
     filled++;
   }
}

void draw() {
  mouseHover(mouseX, mouseY);
  background(255);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      board[i][j].display();
    }
  }
  displayHint();
  displayWinner();
  replay();
}

void mouseHover(int x, int y)
{
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(board[i][j].isAvailable()){
          helper.moveHint();
      }
    }
  }
}

void mousePressed()
{
    if(win == 0){
      for(int i = 0; i < cols; i++){
        for(int j = 0; j < rows; j++){
          if(board[i][j].isInside(mouseX,mouseY)){
              if(board[i][j].isAvailable()){
                board[i][j].state = 1;
                board[i][j].label = playerMarker;
                turns++;
                filled++;

                if(filled > 4)
                  checkForWin();
                if(turns < 5 && win == 0){
                //  computerMove();
                  filled++;

                }
                if(filled > 4)
                  checkForWin();
              }
        else{
              /**Plays buzzer sound when clicking on a filled cell**/
              file = new SoundFile(this, "buzzer.mp3");
              System.out.print("Invalid Move");
              file.play();
        }
          }
        }
      }
    }
}

void computerMove(){
  next = true;
  Button1 move = board[0][0];
  Button1 moveList[] = {board[1][1],board[0][0],board[2][0],board[0][2],board[2][2],board[1][0],board[0][1],board[2][1],board[1][2]};

  if(turns == 0){
    int i = (Math.random() <= 0.5) ? 0 : 2;
    int j = (Math.random() <= 0.5) ? 0 : 2;
    move = board[i][j];
    move.state = 1;
    move.label = compMarker;
    return;
  }else{
    move = nextTurnWin(compMarker);
    if(next == false){
      move.state = 1;
      move.label = compMarker;
      return;
    }

    move = nextTurnWin(playerMarker);
    if(next == false){
      move.state = 1;
      move.label = compMarker;
      return;
    }

    move = createFork(compMarker);
    if(next == false){
      move.state = 1;
      move.label = compMarker;
      return;
    }

    move = stopFork(playerMarker);
    if(next == false){
      move.state = 1;
      move.label = compMarker;
      return;
    }

    for(int i = 0; i < 8; i=i+1){
      if(moveList[i].isAvailable() == true){
        move = moveList[i];
        move.state = 1;
        move.label = compMarker;
        next = false;
        return;
      }
    }
  }
}

void displayWinner(){
  fill(0);
  textSize(100);
  textAlign(CENTER);

  if(player1 == win){
    text("YOU WON!",width/2,height/2-25);
      gameOver = true;
  }
  else if(player1 != win && win != 0){
    text("YOU LOST!",width/2,height/2-25);
      gameOver = true;
  }
  if(filled == 9 && win == 0){
    text("TIED!",width/2,height/2-25);
      gameOver = true;
  }
}

void displayHint(){
  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
      if(board[i][j].canBlock == true){
        fill(0);
        textSize(50);
        textAlign(RIGHT);
        text("BLOCK THIS MOVE!!",width/2,height/2-25);
        board[i][j].canBlock = false;
      }
      else if(board[i][j].canWin == true){
        fill(0);
        textSize(50);
        textAlign(RIGHT);
        text("WIN!!",width/2,height/2-25);
        board[i][j].canWin = false;
      }
      else if(board[i][j].canFork == true){
        fill(0);
        textSize(50);
        textAlign(RIGHT);
        text("BIG BRAIN MOVES!",width/2,height/2-25);
        board[i][j].canFork = false;
      }
    }
  }
}

void replay(){
  if (gameOver ==  true)
  {
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER. Press space bar to resume.", width/2, height/2);
    if(keyPressed && key == ' '){  //user wants to resume
        gameOver = false;
        setup();
    }
  }
}
