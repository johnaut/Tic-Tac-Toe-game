import java.util.Random;

Button1[][] board;

int cols = 3;
int rows = 3;
int game = 1;
int win = 0;
int player1;
int filled = 0;
int turns = 0;
int gameOver = 0;
char compMarker = ' ';
char playerMarker = ' ';
boolean next = true;


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
  
  return nextMove;
}


void setup() {
  size(600, 600);

  int w = width / cols;
  int h = height / rows;

  board = new Button1[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Button1(w * i, h * j, w, h);
    }
  }
  
  
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
    //<>//
}

void draw() {
  background(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      board[i][j].display();
    }
  }
  displayWinner();
}


void mousePressed()
{
  if(game == 1){
    if(win == 0){
      for(int i = 0; i < cols; i++){
        for(int j = 0; j < rows; j++){
          if(board[i][j].isInside(mouseX,mouseY)){
              if(board[i][j].isAvailable()){
                if(playerMarker == 'X'){
                  board[i][j].state = 1;
                  board[i][j].label = playerMarker;
                  
                }else{
                board[i][j].state = 1;
                board[i][j].label = playerMarker;
                }
                turns++;
                filled++;
                if(filled>4)
                  checkForWin();     
                if(turns < 5 && win == 0){
                computerMove();
                filled++;
                }
                if(filled>4)
                  checkForWin();   
              }
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
        print(move.state);
        print(move,"\n");
        return;
      }
    }  
  }
}

void displayWinner(){
  fill(0);
  textSize(100);
  textAlign(CENTER);
 
  if(player1 == win)
    text("YOU WON!",width/2,height/2-25);
  else if(player1 != win && win != 0)
    text("YOU LOST!",width/2,height/2-25);
  if(filled == 9 && win == 0)
    text("TIED!",width/2,height/2-25);      
}
