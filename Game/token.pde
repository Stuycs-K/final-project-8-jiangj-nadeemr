public class Token {
  private color tokenColor;
  private boolean touchingEnemyToken, touchingFriendlyToken, finished, isBlock,inHomeBase;
  private int spacesAwayFromTriangle;
  private int xspawn,yspawn,xcor,ycor,xLeave,yLeave;
  /* Token constructor - creates a token with color
  and position
  */
  public Token(color clr, int xcord, int ycord) {
    if(clr==red){
      xLeave=28;
      yLeave=(28*16)+18;
    }
    if(clr==color(103,164,224)) {
      xLeave=(55*8) + 28;
      yLeave=(28*31)+40;
    }
    if(clr==color(68,217,61)) {
      xLeave=(55*8) + 28;
      yLeave=(28);
    }
    if(clr==color(242,240,92)) {
      xLeave=(28*32)+12;
      yLeave=(28*16)+18;
    }
    tokenColor = clr;
    xspawn = xcord;
    yspawn = ycord;
    inHomeBase=true;
  }
  /* Checks if a token reached home base. If so, remove the token
  from the game, increase User's numOfTokensFinished
  */
  public boolean checkIfDone(int spacesAwayFromTriangle) {
    return spacesAwayFromTriangle==0;
  }
  /* Checks if you're touching an enemy/friendly token. If 
  touching an enemy token, send enemy token home.
  */
  public boolean checkTouching(Token other) {
    if(other.returnXLeave() == xLeave && other.returnYLeave() == yLeave) {
    return true;
  }
  return false;
  }
  public color getColor(){
    return tokenColor;
  }
  /* Spawns a token at the given position */
  public void spawn(int xspawn, int yspawn) {
    fill(tokenColor);
    circle(xspawn,yspawn,50);
    fill(255,255,255);
    }
  /* Moves a token num places (called in diceRoll) */
  public void move(int num){
    if(inHomeBase==true){
      xspawn=xLeave;
      yspawn=yLeave;
      inHomeBase=false;
    }
    if(((xLeave < 17*50 || xLeave < 256 ) && (yLeave < (28*16)+18) && xLeave > 30 && xLeave < 17*55)) {
       xLeave = xLeave+(num*55);
       xspawn= xLeave;
    } else {
       yLeave = yLeave+(num*55);
       yspawn= yLeave;
    }
  }
  /* Sends a token back to home yard/base. Will be called when
  a token is defeated by an enemy token. */
  public void returnToHomeYard(int xSpawn, int ySpawn) {}
  public int returnXSpawn(){
    return xspawn;
  }
  public int returnYSpawn(){
    return yspawn;
  }
  public int returnXLeave(){
    return xLeave;
  }
  public int returnYLeave(){
    return yLeave;
  }
  public boolean checkHomeBase(){
    return inHomeBase;
  }
  
}
