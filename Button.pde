
class Button {
  PVector Pos = new PVector(0,0);
  float Width;
  float Height;
  color Color ;
  //String label;
  Boolean Pressed = false;
  Boolean Clicked = false;
  int state = 0; //an empty cell "button" on the board

/*Creating a button*/
  Button(int x, int y, int w, int h)
  {
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
  }

  void update()
  {
    if(mousePressed == true && mouseButton == LEFT && Pressed == false)
    {
      Pressed = true;
      //Checks if mouse is hovered over button
      if(mouseX >= Pos.x && mouseX <= Pos.x + Width && mouseY >= Pos.y && mouseY <= Pos.y + Height)
      {
        Clicked = true;
        state =  1;
      }
    }else
    {
      Clicked = false;
      Pressed = false;
    }
  }

  /*must be placed in void draw() to render button onto screen
   Render displays the state of the "button" in game */
  void render()
  {

    strokeWeight(3);
    rect(Pos.x, Pos.y, Width, Height);

    if(state == 1)
    {
      ellipseMode(CORNER);
      stroke(0,0,255);
      ellipse(Pos.x, Pos.y, Width, Height);
    }
    else if(state == 2)
    {
      stroke(255, 0,0);
      line(Pos.x, Pos.y, Pos.x + Width, Pos.y + Height);
      line(Pos.x + Width, Pos.y, Pos.x, Pos.y + Height);
    }
  }

  boolean isPressed()
  {
    return Pressed;
  }
  boolean isClicked()
  {
   return Clicked;
  }
}
