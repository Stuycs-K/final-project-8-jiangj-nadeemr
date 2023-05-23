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
  gameBoard=new int[17][17];
  }
  /*
  Creates the physical Ludo Board that will be
  displayed in the processing screen. Adds tokens
  for each user playing.
  */
  public void createBoard(int players) {
    for(int i=0;i<17;i++){
      for(int j=0;j<17;j++){
        if(i!=0&&i!=16&&j!=0&&j!=16){
        gameBoard[i][j]=-1;
    }
      else{
        gameBoard[i][j]=0;
    }
    }
    for(int i=1;i<16;i++){
      gameBoard[i][8]=0;
      gameBoard[8][i]=0;
    }
    gameBoard[0][8]=-2; //special space for red
    gameBoard[8][0]=-3; //special space for blue
    gameBoard[16][8]=-4; // special space for green
    gameBoard[8][16]=-5;// special space for yellow
    gameBoard[8][8]=-6;
    }
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
