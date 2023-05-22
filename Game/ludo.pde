public class Ludo {
  private int userTurn;
  private int numPlayers;
  private int[][] gameBoard;
  /*
  Constructor for Ludo Board
  Initalizes numPlayers and userTurn for the game
  Sets up the 2d-array gameBoard with 0's
  */
  public Ludo() {}
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
  public boolean checkWinner(User player) {return false;}
  
  /*
  Returns number of players for the game.
  */
  public int getNumPlayers() { return -1; }
  
  /*
  Returns which player's turn it is.
  */
  public int getUserTurn() { return -1; }
  
}
