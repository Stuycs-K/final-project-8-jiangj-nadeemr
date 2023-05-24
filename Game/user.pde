public class User extends Ludo {
  private int numOfTokensInHome;
  private int numOfTokensFinished;
  private color colorOfToken;
  private Token currentToken;
  /*
  on player turn, roll the dice and return the results ( 1-6)
  */
  public int diceRoll(){
    return 1+(int)(Math.random()*6);
  }
  /*
  when a valid token is clicked, move it by the number returned by diceroll;
  */
  public void onMousePressed(){
    int spacesToMove=diceRoll();
    if(currentToken.getColor()==(colorOfToken)){
        currentToken.move(spacesToMove);
  }
  }
  
  
  public int getNumOfTokensInHome(){
    return numOfTokensInHome;
  }
  public int getNumOfTokensFinished(){
    return numOfTokensFinished;
  }
  
  
  
}

  
