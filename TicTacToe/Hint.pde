class Hint{
  char label;
  Button1[][] board;
  int turns;

  /**hint constructor is passed the marker of the player and
    the state of the board
  **/

  Hint(char playerLabel, Button1[][] board, int turns){
    this.label = playerLabel;
    this.board = board;
    this.turns = turns;
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
      /**Highlight red for potential loss**/
      if(next == false){
        move.canBlock = true;
        return;
      }
      /**Highlight green for potential win**/
        move = nextTurnWin(playerMarker);
        if(next == false){
          move.canWin = true;
          return;
        }
      /**Highlight green for potential fork**/
        move = createFork(playerMarker);
        if(next == false){
          move.canFork = true;
          return;
        }

        move = stopFork(compMarker);
        if(next == false){
          move.canBlockFork = true;
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
