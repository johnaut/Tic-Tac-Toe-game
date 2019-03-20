import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TicTacToe extends PApplet {


Button1[][] board;

int cols = 3;
int rows = 3;
int full = 9;
int game = 1;
int win = 0;
int player1;

int turns = 0;

public void setup() {
  

  int w = width / cols;
  int h = height / rows;

  board = new Button1[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Button1(w * i, h * j, w, h);
    }
  }

   player1 = (Math.random() <= 0.5f) ? 1 : 2;

   if(player1 == 2){
     computerMove();
   }

    //<>//
}

public void draw() {
  background(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      board[i][j].display();
    }
  }


}

public void mousePressed()
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


public void computerMove(){

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

/*if(board[i][j].isPressed() == true)
{
  ellipse(mouseX + board[i][j].Width/2, mouseY + board[i][j].Height/2, board[i][j].Width, board[i][j].Height);
}*/

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
  
   public void display() {
    stroke(0);
    fill(255);  
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    
    if(state==1){
    text(label, x + (w / 2), y + (h / 2));
    }
    
  }
  
  
public boolean isInside (float mx, float my) {
   if (mx > x && mx < (x + w) && my > y && my < (y + h)) {
      return true;
    }
    return false;
  }
  
public boolean isAvailable(){
  if(state == 1)
    return false;
return true;
}
}
  
  
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TicTacToe" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
