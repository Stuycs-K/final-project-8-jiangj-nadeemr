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
    color blue= color(103,164,224);
    color yellow= color(242,240,92);
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
    else if(colorOfToken==blue){
    Token first= new Token(x,150,600);
    Token second=new Token(x,150,750);
    Token third=new Token(x,300,600);
    Token fourth=new Token(x,300,750);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
  }
  else if(colorOfToken==yellow){
    Token first= new Token(x,600,600);
    Token second=new Token(x,600,750);
    Token third=new Token(x,750,600);
    Token fourth=new Token(x,750,750);
    tokenList.add(first);
    tokenList.add(second);
    tokenList.add(third);
    tokenList.add(fourth);
  }
  }
  public void spawnTokens(){
    for(int i=0;i<4;i++){
      this.newCurrentToken(i);
      Token j= this.returnToken();
      int x= j.returnXSpawn();
      int y= j.returnYSpawn();
      j.spawn(x,y);
    }
  }
    
  /*
  when a valid token is clicked, move it by the number returned by diceroll;
  */
  public void onMousePressed(int spacesToMove){
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
  public boolean checkClicking(int x,int y){
    for(int i=0;i<4;i++){
      if(tokenList.get(i).returnXSpawn()>=x-25&&tokenList.get(i).returnXSpawn()<=x+25){
          if(tokenList.get(i).returnYSpawn()>=y-25&&tokenList.get(i).returnYSpawn()<=y+25){
            if(tokenList.get(i).getColor()==colorOfToken&&currentToken!=tokenList.get(i)){
              return true;
            }
          }
      }
    }
    return false;
  }
  public void changeCurrentToken(int x,int y){
      for(int i=0;i<4;i++){
        if(tokenList.get(i).returnXSpawn()>=x-25&&tokenList.get(i).returnXSpawn()<=x+25){
          if(tokenList.get(i).returnYSpawn()>=y-25&&tokenList.get(i).returnYSpawn()<=y+25){
            if(tokenList.get(i).getColor()==colorOfToken&&currentToken!=tokenList.get(i)){
              newCurrentToken(i);
          }
        }
      }
    }
  }
  }
 

  
