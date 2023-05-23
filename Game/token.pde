public class Token {
  private String tokenColor;
  private boolean touchingEnemyToken, touchingFriendlyToken, finished, isBlock;
  private int spacesAwayFromTriangle;
  private int xspawn,yspawn;
  /* Token constructor - creates a token with color
  and position
  */
  public Token(color clr, int xcord, int ycord) {

  }
  /* Checks if a token reached home base. If so, remove the token
  from the game, increase User's numOfTokensFinished
  */
  public boolean checkIfDone(int spacesAwayFromTriangle) {
    return false;
  }
  /* Checks if you're touching an enemy/friendly token. If 
  touching an enemy token, send enemy token home.
  */
  public boolean checkTouching(Token other) {
    return false;
  }
  /* Spawns a token at the given position */
  public void spawn(int xspawn, int yspawn) {}
  /* Moves a token num places (called in diceRoll) */
  public void move(int num) {}
  /* Sends a token back to home yard/base. Will be called when
  a token is defeated by an enemy token. */
  public void returnToHomeYard(int xSpawn, int ySpawn) {}
  
}
