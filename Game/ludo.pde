public class Ludo {
  private int userTurn;
  private int numPlayers;
  private int[][] gameBoard;
  /*
  Constructor for Ludo Board
  Initalizes numPlayers and userTurn for the game
  Sets up the 2d-array gameBoard with 0's
  */
  public Ludo() {
  // need dimensons for ludo board
  numPlayers = 4;
  userTurn = 1;
  }
  /*
  Creates the physical Ludo Board that will be
  displayed in the processing screen. Adds tokens
  for each user playing.
  */
  public void createBoard(int players) {}
  /*
  Method is ran after every player turn. 
  Checks if User.numOfTokensFinished == 4
  */
  public boolean checkWinner(User player) {
  return player.numOfTokensFinished == 4;
}
  
  /*
  Returns number of players for the game.
  */
  public int getNumPlayers() { 
    return numPlayers;
}
  
  /*
  Returns which player's turn it is.
  */
  public int getUserTurn() {
    return userTurn;
  }
}
