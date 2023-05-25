public class User extends Ludo {
  private int numOfTokensInHome;
  private int numOfTokensFinished;
  private color colorOfToken;
  private Token currentToken;
  private ArrayList<Token> tokenList=new ArrayList<Token>(4);
  /*
  on player turn, roll the dice and return the results ( 1-6)
  */
  public int diceRoll(){
    return 1+(int)(Math.random()*6);
  }
  public User(color x){
    color red=color(219,48,48);
    color green = color(68,217,61);
    numOfTokensInHome=3;
    numOfTokensFinished=0;
    colorOfToken=x;
    if(colorOfToken == red) {
    Token first= new Token(x,150,150);
    Token second=new Token(x,300,300);
    Token third=new Token(x,150,300);
    Token fourth=new Token(x,300,150);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
    } else if(colorOfToken == green) {
    Token first= new Token(x,600,150);
    Token second=new Token(x,600,300);
    Token third=new Token(x,750,150);
    Token fourth=new Token(x,750,300);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
    }
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
  public Token returnToken(){
    return currentToken;
  }
   public void newCurrentToken(int x){
    currentToken=tokenList.get(x);
  }

  
}

  
