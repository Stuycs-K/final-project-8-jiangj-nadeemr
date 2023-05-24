public class Token {
  private color tokenColor;
  private boolean touchingEnemyToken, touchingFriendlyToken, finished, isBlock;
  private int spacesAwayFromTriangle;
  private int xspawn,yspawn,xcor,ycor;
  /* Token constructor - creates a token with color
  and position
  */
  public Token(color clr, int xcord, int ycord) {
    tokenColor = clr;
    xspawn = xcord;
    yspawn = ycord;
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
  public void move(int num) {
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
  
}
