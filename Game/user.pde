public class User extends Ludo {
  private int numOfTokensInHome;
  private int numOfTokensFinished;
  private int numOfTokensInPlay;
  private color colorOfToken;
  private Token currentToken;
  private ArrayList<Token> tokenList=new ArrayList<Token>(4);
  private boolean userFinished;
  public User(color x){
    color red=color(219,48,48);
    color green = color(68,217,61);
    color blue= color(103,164,224);
    color yellow= color(242,240,92);
    numOfTokensInHome=4;
    numOfTokensFinished=0;
    userFinished=false;
    colorOfToken=x;
    if(colorOfToken == red) {
    Token first= new Token(x,150,150,0);
    Token second=new Token(x,300,300,1);
    Token third=new Token(x,150,300,2);
    Token fourth=new Token(x,300,150,3);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
    } else if(colorOfToken == green) {
    Token first= new Token(x,600,150,0);
    Token second=new Token(x,600,300,1);
    Token third=new Token(x,750,150,2);
    Token fourth=new Token(x,750,300,3);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
    }
    else if(colorOfToken==blue){
    Token first= new Token(x,150,600,0);
    Token second=new Token(x,150,750,1);
    Token third=new Token(x,300,600,2);
    Token fourth=new Token(x,300,750,3);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
  }
  else if(colorOfToken==yellow){
    Token first= new Token(x,600,600,0);
    Token second=new Token(x,600,750,1);
    Token third=new Token(x,750,600,2);
    Token fourth=new Token(x,750,750,3);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
  }
  currentToken=tokenList.get(0);
  }
  public void spawnTokens(){
    for(int i=0;i<tokenList.size();i++){
      Token j= tokenList.get(i);
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
  
  public void updateDefeat(){
     for(int i=0;i<tokenList.size();i++){
      if(tokenList.get(i).checkDefeated()==true){
        numOfTokensInHome++;
        numOfTokensInPlay--;
        tokenList.get(i).changeDefeated(false);
      }
     }
  }
  public boolean checkClicking(int x,int y,int num){
    for(int i=0;i<tokenList.size();i++){
      if(tokenList.get(i).returnXSpawn()>=x-25&&tokenList.get(i).returnXSpawn()<=x+25){
          if(tokenList.get(i).returnYSpawn()>=y-25&&tokenList.get(i).returnYSpawn()<=y+25){
            if(tokenList.get(i).getColor()==colorOfToken){
              if(tokenList.get(i).checkHomeBase()==false||num==6){
                 if(tokenList.get(i).checkHomeBase()==true){
                   onBoard.add(tokenList.get(i));
                   numOfTokensInHome--;
                   numOfTokensInPlay++;
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
              currentToken=tokenList.get(i);
          }
        }
      }
    }
  }
  public void tokenFinished(){
    if(returnToken().checkFinished()==true&&returnToken().checkIfDone(returnToken().returnSpaces())){
    numOfTokensFinished++;
    numOfTokensInPlay--;
    tokenList.remove(returnToken());
    userFinished();
  }
}
  public void userFinished(){
    if(tokenList.size()==0){
      userFinished=true;
    }
  }
  public boolean returnUserFinished(){
    return userFinished;
  }
  public void checkBlock(){
    for(int i=0;i<tokenList.size();i++){
      Token newToken=tokenList.get(i);
      if(currentToken.returnNumToken()!=newToken.returnNumToken()){
        if(currentToken.returnXSpawn()==newToken.returnXSpawn()){
          if(currentToken.returnYSpawn()==newToken.returnYSpawn()){
            currentToken.changeBlock(true);
            newToken.changeBlock(true);
            System.out.println("worked");
          }
        }
      }
      else{
        currentToken.changeBlock(false);
        newToken.changeBlock(false);
    }
  }
  
}
}
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
 
