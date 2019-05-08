/**
*Tic-Tac-Toe (Final Implemenation)
*Authors: John Autencio, Tony Gonzalez, Bar Rakovsky, Antonio Sanchez
*5-8-19
**/
import java.util.Random;
import javax.swing.*;
import processing.sound.*;

SoundFile file;
Cell[][] board;
Hint helper;
int size; //Default size of the Grid 3x3
int win, filled, turns, player1;
char compMarker = ' ';
char playerMarker = ' ';
boolean gameOver = false;
boolean ctrlPressed = false;
boolean zPressed = false;
boolean next = true; //flag that makes computer check for next possible move


void setup() {
  size(1200, 1200);
  filled = 0;
  turns = 0;
  win = 0;

  size = Integer.parseInt(JOptionPane.showInputDialog("Please Enter Size of Grid (between 3 and 8)"));
  print("Size is " + size);board[2][0],
  int w = 600;
  int h = 600;

  board = new Cell[size][size];
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      board[i][j] = new Cell(w * i/size, h * j/size, w/size, h/size);
    }
  }
  assignMarker();
//  helper = new Hint(playerMarker, board, turns);
}

void assignMarker(){
  player1 = 1;
  //player1 = (Math.random() <= 0.5) ? 1 : 2;
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
     //computerMove();
     //filled++;
   }
}

void draw() {
  background(255);
  fill(0);
  textSize(100);
  text("Tic Tac Toe",900,25);
  for(int i = 0; i < size; i++){
    for(int j = 0; j < size; j++){
      board[i][j].display();
    }
  }
  displayWinner();
  replay();

}

public boolean hasXWon() {
  if ((board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] == 1) || (board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] == 1)) {
    return true;
  }
  for (int i = 0; i < 3; ++i) {
    if (((board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] == 1)
    || (board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] == 1))) {
      return true;
    }
  }
  return false;
}

public boolean hasOWon() {
  if ((board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] == 2) || (board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] == 2)) {
    return true;
  }
  for (int i = 0; i < 3; ++i) {
    if ((board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] == 2)
    || (board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] == 2)) {
      return true;
    }
  }

  return false;
}

void checkWin(board){
  for(int i = 0; i < 3; i++){
    boolean
  }
}

void mouseHover(int x, int y)
{
  for(int i = 0; i < size; i++){
    for(int j = 0; j < size; j++){
      if(board[i][j].isInside(x,y)){
        if(!gameOver)
        //  helper.moveHint();
        if(board[i][j].canBlock == true || board[i][j].canBlockFork == true ){
          fill(0);
          textSize(50);
          text("BLOCK THIS MOVE!!",900,400);
          board[i][j].canBlock = false;
        }
        else if(board[i][j].canWin == true){
          fill(0);
          textSize(50);
          text("WIN!!",900,400);
          board[i][j].canWin = false;
        }
        else if(board[i][j].canFork == true){
          fill(0);
          textSize(50);
          text("You can create a fork!",900,400);
          board[i][j].canFork = false;
        }
      }
    }
  }
}

void mousePressed()
{
    if(win == 0){
      for(int i = 0; i < size; i++){
        for(int j = 0; j < size; j++){
          if(board[i][j].isInside(mouseX,mouseY)){
              if(board[i][j].isAvailable()){
                board[i][j].state = 1;
                board[i][j].label = playerMarker;
                turns++;
                //filled++;

              /*
                if(filled > 4)
                  checkForWin();
              */
                if(turns < 5 && win == 0){
                //  computerMove();  /*Comment this method call out to test hint win/fork use cases*/
                }
              /*
                if(filled > 4)
                  checkForWin();
                  */
              }
        else{
          /**Plays buzzer sound when clicking on a filled cell**/
              file = new SoundFile(this, "buzzer.mp3");
              System.out.print("Invalid Move");
              file.play();
        }
          }
          /**This block of code reverts state of button after a mouse press**/
          board[i][j].canWin = false;
          board[i][j].canBlock = false;
          board[i][j].canFork = false;
          board[i][j].canBlockFork = false;
          board[i][j].c = color(255);
        }
      }
    }
//checkForWin();
}

public List<Cell> getAvailableStates(){
  availablePoints = new ArrayList<>();
  for(int i = 0; i < SIZE; i++){
    for(int j = 0; j < SIZE; j++){
      if(board[i][j].isAvailable() == false){
        availablePoints.add(new Cell(i,j));
      }
    }
  }
}

public void computerMove(Cell[][]){
  Cell nextMove = board[0][0];
}

public int miniMax(int depth, int turn)
{
  if(hasXWon()) return +1;
  if(hasOWon()) return +1;

  List<Cell> cellsAvailable = getAvailableStates();

  if(cellsAvailable.isEmpty()) return 0;

  int min = Integer.MAX_VALUE, max = Integer.MIN_VALUE;

  for(int i = 0; i < cellsAvailable.size(); i++)
  {
    Cell cell = cellsAvailable.get(i);
    if(turns == 1){
     int currentScore = minimax(depth + 1, 2);
     max = Math.max(currentScore, max);

     if(depth == 0)System.out.println("Score for position "+(i+1)+" = "+currentScore);
     if(currentScore >= 0){ if(depth == 0) computersMove = point;}
     if(currentScore == 1){board[point.x][point.y] = 0; break;}
     if(i == pointsAvailable.size()-1 && max < 0){if(depth == 0)computersMove = point;}

     }else if (turn == 2) {
                placeAMove(point, 2);
                int currentScore = minimax(depth + 1, 1);
                min = Math.min(currentScore, min);
                if(min == -1){board[point.x][point.y] = 0; break;}
            }
            board[point.x][point.y] = 0; //Reset this point
        }
        return turn == 1?max:min;
    }
}

void displayWinner(){
  fill(0);
  textSize(100);

  if(player1 == win){
    text("YOU WON!",900,200);
      gameOver = true;
      for(int i = 0; i < size; i++){
        for(int j= 0; j < size; j++){
          board[i][j].canWin = false;
          board[i][j].canBlock = false;
          board[i][j].canFork = false;
          board[i][j].canBlockFork = false;
          board[i][j].c = color(255);
        }
      }
  }
  else if(player1 != win && win != 0){
    text("YOU LOST!",900,200);
      gameOver = true;
      for(int i = 0; i < size; i++){
        for(int j = 0; j < size; j++){
          board[i][j].canWin = false;
          board[i][j].canBlock = false;
          board[i][j].canFork = false;
          board[i][j].canBlockFork = false;
          board[i][j].c = color(255);
        }
      }
  }
  if(filled == 9 && win == 0){
    text("TIED!",900,200);
      gameOver = true;
      for(int i = 0 ; i < size; i++){
        for(int j = 0; j < size; j++){
          board[i][j].canWin = false;
          board[i][j].canBlock = false;
          board[i][j].canFork = false;
          board[i][j].canBlockFork = false;
          board[i][j].c = color(255);
        }
      }
  }
}

void undoMove(){
  if(keyPressed && key == 'z')
    zPressed = true;
      if(keyCode == CODED && key == CONTROL){
        ctrlPressed =  true;
        if(zPressed == true && ctrlPressed == true)
          System.out.println("Undoing move");
      }
    }

void replay(){
  if (gameOver ==  true)
  {
    fill(0);
    textSize(30);
    text("GAME OVER", 900, 500);
    text("Press space bar to resume. q to quit", 900, 550);
    if(keyPressed && key == ' '){  //user wants to resume
        gameOver = false;
        setup();
    }
    if(keyPressed && key == 'q'){
      System.exit(0);
    }
  }
}
