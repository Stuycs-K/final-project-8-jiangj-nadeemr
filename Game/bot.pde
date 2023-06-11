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
  }
  public void newCurrentToken(Token x){
    currentToken=x;
  }
  public Token randomToken(){
    if(tokenPlayable.size()>0){
    int x=(int)Math.random()*tokenPlayable.size();
    newCurrentToken(tokenPlayable.get(x));
    return currentToken;
    }
    else{
      return null;
    }
  }
public Token tokenInHome(){
  for(int i=0;i<tokenList.size();i++){
    if(tokenList.get(i).checkHomeBase()==true){
      newCurrentToken(tokenList.get(i));
      numOfTokensInHome--;
      numOfTokensInPlay++;
      onBoard.add(tokenList.get(i));
      break;
    }
  }
  return currentToken;
}
}
