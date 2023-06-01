public class User extends Ludo {
  private int numOfTokensInHome;
  private int numOfTokensFinished;
  private int numOfTokensInPlay;
  private color colorOfToken;
  private Token currentToken;
  private ArrayList<Token> tokenList=new ArrayList<Token>(4);
  public User(color x){
    color red=color(219,48,48);
    color green = color(68,217,61);
    color blue= color(103,164,224);
    color yellow= color(242,240,92);
    numOfTokensInHome=4;
    numOfTokensFinished=0;
    colorOfToken=x;
    if(colorOfToken == red) {
    Token first= new Token(x,150,150,1);
    Token second=new Token(x,300,300,2);
    Token third=new Token(x,150,300,3);
    Token fourth=new Token(x,300,150,4);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
    } else if(colorOfToken == green) {
    Token first= new Token(x,600,150,1);
    Token second=new Token(x,600,300,2);
    Token third=new Token(x,750,150,3);
    Token fourth=new Token(x,750,300,4);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
    }
    else if(colorOfToken==blue){
    Token first= new Token(x,150,600,1);
    Token second=new Token(x,150,750,2);
    Token third=new Token(x,300,600,3);
    Token fourth=new Token(x,300,750,4);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
  }
  else if(colorOfToken==yellow){
    Token first= new Token(x,600,600,1);
    Token second=new Token(x,600,750,2);
    Token third=new Token(x,750,600,3);
    Token fourth=new Token(x,750,750,4);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
  }
  }
  public void spawnTokens(){
    for(int i=0;i<tokenList.size();i++){
      this.newCurrentToken(i);
      Token j= this.returnToken();
      int x= j.returnXSpawn();
      int y= j.returnYSpawn();
      j.spawn(x,y);
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
  public Token returnToken(){
    return currentToken;
  }
   public void newCurrentToken(int x){
    currentToken=tokenList.get(x);
  }
  public boolean checkClicking(int x,int y,int num){
    for(int i=0;i<tokenList.size();i++){
      if(tokenList.get(i).returnXSpawn()>=x-25&&tokenList.get(i).returnXSpawn()<=x+25){
          if(tokenList.get(i).returnYSpawn()>=y-25&&tokenList.get(i).returnYSpawn()<=y+25){
            if(tokenList.get(i).getColor()==colorOfToken){
              if(tokenList.get(i).checkHomeBase()==false||num==6){
                 if(tokenList.get(i).checkHomeBase()==true){
                   ArrayList<Token> copyBoard = tokenList.get(i).onBoard;
                   numOfTokensInHome--;
                   numOfTokensInPlay++;
                   copyBoard.add(tokenList.get(i));
                   tokenList.get(i).onBoard = copyBoard;
                }
                if(tokenList.get(i).checkFinished()==true){
                  ArrayList<Token> copyBoard = tokenList.get(i).onBoard;
                  tokenFinished();
                  copyBoard.remove(tokenList.get(i));
                  tokenList.get(i).onBoard = copyBoard;
                  return false;
                }
                return true;

              }
            }
          }
      }
    }
    return false;
  }
  public void changeCurrentToken(int x,int y){
      for(int i=0;i<tokenList.size();i++){
        if(tokenList.get(i).returnXSpawn()>=x-25&&tokenList.get(i).returnXSpawn()<=x+25){
          if(tokenList.get(i).returnYSpawn()>=y-25&&tokenList.get(i).returnYSpawn()<=y+25){
            if(tokenList.get(i).getColor()==colorOfToken&&currentToken!=tokenList.get(i)){
              newCurrentToken(i);
          }
        }
      }
    }
  }
  public void tokenFinished(){
    if(returnToken().checkFinished()==true){
    numOfTokensFinished++;
    numOfTokensInPlay--;
    tokenList.remove(returnToken());
    System.out.println("worked");
  }
}
}
