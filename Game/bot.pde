public class Bot extends User{
  private int numberOfTokensInHome;
  private int numberOfTokensFinished;
  private int numberOfTokensInPlay;
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
    numberOfTokensInHome=4;
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
    return numberOfTokensInHome;
  }
public Token tokenInHome(){
  for(int i=0;i<accessorTokenList().size();i++){
    if(accessorTokenList().get(i).checkHomeBase()==true){
      currentToken=(accessorTokenList().get(i));
      numberOfTokensInHome--;
      numberOfTokensInPlay++;
      onBoard.add(accessorTokenList().get(i));
      tokenPlayable.add(accessorTokenList().get(i));
      break;
    }
  }
  return currentToken;
}
}
