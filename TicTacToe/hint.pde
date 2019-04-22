class hint{
  char label;
  Button1[][] board;
  boolean canBlock = false;
  boolean canWin = false;
  boolean canFork = false;

  
  /**hint constructor is passed the marker of the player and
    the state of the board
  **/
  hint(char playerLabel, Button1[][] board){
    this.label = playerLabel;
    this.board = board;
  }

  /**moveHint should act like computerMove, to simulate the computer
  * matching a move against another computer player. However, instead of
  * changing the board during play, it should highlight the best possible move
  * for the human player**/
  void moveHint()
  {
    next = true;
    Button1 move = board[0][0];
    Button1 moveList[] = {board[1][1],board[0][0],board[2][0]
      ,board[0][2],board[2][2],board[1][0],board[0][1],board[2][1],board[1][2]};

        move = nextTurnWin(compMarker);
        if(next == false){
        //  move.fill(51,255,51); //suggest this move
          return;
        }

        move = nextTurnWin(playerMarker);
        if(next == false){
          //move.fill(51,255,51); //suggest this move
          return;
        }

        move = createFork(compMarker);
        if(next == false){
          //move.fill(51,255,51); //suggest this move
          return;
        }

        move = stopFork(playerMarker);
        if(next == false){
          //move.fill(51,255,51); //suggest this move
          return;
        }

        for(int i = 0; i < 8; i=i+1){
          if(moveList[i].isAvailable() == true){
            move = moveList[i];
            next = false;
            return;
          }
        }
      }

  }
