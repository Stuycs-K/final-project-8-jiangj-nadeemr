public class Bot extends User{
  private int numOfTokensInHome;
  private int numOfTokensFinished;
  private int numOfTokensInPlay;
  private color colorOfToken;
  private Token currentToken;
  private ArrayList<Token> tokenList=new ArrayList<Token>(4);
  private boolean userFinished;
  color red=color(219,48,48);
  color green = color(68,217,61);
  color blue= color(103,164,224);
  color yellow= color(242,240,92);
  private ArrayList<Token>tokenPlayable=new ArrayList<Token>();
  public Bot(color x){
    super(x);
    numOfTokensInHome=4;
    numOfTokensInPlay=0;
   numOfTokensFinished=0;
  }
  public Token randomToken(){
    if(tokenPlayable.size()>0){
    int x=(int)(Math.random()*tokenPlayable.size());
    currentToken=tokenPlayable.get(x);
    return currentToken;
    }
    else{
      return null;
    }
  }
  public int getNumOfTokensInHome(){
    return numOfTokensInHome;
  }
  public int getNumOfTokensInPlay(){
    return numOfTokensInPlay;
  }
  public int getNumOfTokensFinished(){
    return numOfTokensFinished;
  }
public Token tokenInHome(){
  for(int i=0;i<accessorTokenList().size();i++){
    if(accessorTokenList().get(i).checkHomeBase()==true){
      currentToken=(accessorTokenList().get(i));
      numOfTokensInHome--;
      numOfTokensInPlay++;
      onBoard.add(accessorTokenList().get(i));
      tokenPlayable.add(accessorTokenList().get(i));
      break;
    }
  }
  return currentToken;
}
public void updateDefeat(){
  for(int i=0;i<accessorTokenList().size();i++){
      if(accessorTokenList().get(i).checkDefeated()==true){
        System.out.println(this.getColorOfTokens()+" has token defeated");
        numOfTokensInHome++;
        numOfTokensInPlay--;
        accessorTokenList().get(i).changeDefeated(false);
        tokenPlayable.remove(accessorTokenList().get(i));
      }
  }
}
}
