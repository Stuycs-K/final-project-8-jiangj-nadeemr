public class Token {
  private color tokenColor;
  private boolean finished, isBlock,inHomeBase,finalTurn,defeated;
  private int spacesAwayFromTriangle;
  private int xspawn,yspawn,xLeave,yLeave,numToken,xHome,yHome;
  /* Token constructor - creates a token with color
  and position
  */
  public Token(color clr, int xcord, int ycord,int num) {
     if(clr==red){
      xLeave=28;
      yLeave=578;
    }
    if(clr==color(103,164,224)) {
      xLeave=578;
      yLeave=908;
    }
    if(clr==color(68,217,61)) {
      xLeave=358;
      yLeave=(28);
    }
    if(clr==color(242,240,92)) {
      xLeave=908;
      yLeave=358;
    }
    tokenColor = clr;
    xspawn = xcord;
    yspawn = ycord;
    xHome=xcord;
    yHome=ycord;
    numToken=num;
    finished=false;
    inHomeBase=true;
    finalTurn=false;
    defeated=false;
  }
  /* Checks if a token reached home base. If so, remove the token
  from the game, increase User's numOfTokensFinished
  */
  public boolean checkIfDone(int spacesAwayFromTriangle) {
    return spacesAwayFromTriangle==0;
  }
  /* Checks if you're touching an enemy/friendly token. If 
  touching an enemy token, send enemy token home.
  */
  public void checkTouching() {
    onBoard.remove(this);
    System.out.println();
    for(int i = 0; i < onBoard.size(); i++) {
      if(onBoard.get(i).returnXLeave() == xLeave && onBoard.get(i).returnYLeave() == yLeave) {
        if(onBoard.get(i).getColor()!=this.getColor()){
        onBoard.get(i).returnToHomeYard();
        onBoard.remove(i);
        
    }
      }
   }
   onBoard.add(this);
  }
  public ArrayList<Token> returnOnBoard() {
    return onBoard;
  }
  public color getColor(){
    return tokenColor;
  }
  /* Spawns a token at the given position */
  public void spawn(int xspawn, int yspawn) {
    fill(tokenColor);
    circle(xspawn,yspawn,50);
    fill(255,255,255);
    }
  /* Moves a token num places (called in diceRoll) */
  public void move(int num){
    if(inHomeBase==true&&num==6){
      xspawn=xLeave;
      yspawn=yLeave;
      inHomeBase=false;
    }
    else{
      for(int i = 1; i <= num; i++) {
        
        if(getColor()==red&&xLeave==28&&yLeave==468){
          finalTurn=true;
        }
        if(getColor()==green&&xLeave==468&&yLeave==28){
          finalTurn=true;
        }
        if(getColor()==yellow&&xLeave==908&&yLeave==468){
          finalTurn=true;
        }
        if(getColor()==blue&&xLeave==468&&yLeave==908){
          finalTurn=true;
        }
        if(finalTurn==true){
          if(getColor()==red){
            xLeave=xLeave+55;
            xspawn=xLeave;
            if(xspawn==468){
              finished=true;
            }
          }
   
          if(getColor()==green){
            yLeave=yLeave+55;
            yspawn=yLeave;
            if(yspawn==468){
              finished=true;
            }
            }
          
          if(getColor()==yellow){
            xLeave=xLeave-55;
            xspawn=xLeave;
            if(xspawn==468){
              finished=true;
            }
            }
          
          if(getColor()==blue){
            
            yLeave=yLeave-55;
            yspawn=yLeave;
            if(yspawn==468){
              finished=true;
            }
            
          }
        }
     
        else if(xLeave+55 < 935 && ((yLeave==0) || (yLeave + 55) >= 935)) {
             xLeave = xLeave+55;
             xspawn= xLeave;
        } else if(xLeave+55 >=935 && yLeave-55 >=0) { 
             yLeave = yLeave-55;
             yspawn = yLeave;
        } else if(yLeave-55 <= 0 && xLeave-55 >=0) {
             xLeave = xLeave-55;
             xspawn = xLeave;
        } else {
             yLeave = yLeave+55;
             yspawn = yLeave;
      }
      }
  }
 }
  /* Sends a token back to home yard/base. Will be called when
  a token is defeated by an enemy token. */
  public void returnToHomeYard() {
    xspawn=xHome;
    yspawn=yHome;
    defeated=true;
    inHomeBase=true;
  }
  public int returnXSpawn(){
    return xspawn;
  }
  public int returnYSpawn(){
    return yspawn;
  }
  public int returnXLeave(){
    return xLeave;
  }
  public int returnYLeave(){
    return yLeave;
  }
  public boolean checkDefeated(){
    return defeated;
  }
  public void changeDefeated(boolean x){
    defeated=x;
  }
  public boolean checkHomeBase(){
    return inHomeBase;
  }
  public void leaveHome(){
    inHomeBase=false;
  }
  public boolean checkFinished(){
    return finished;
  }
  public void printOnBoard(){
    System.out.print(onBoard.size()+" ");
  }


  //red 28,468
  //green 468,28
  //yellow 908,468
  //blue 468, 908
  /*
 
    if(clr==red){
      xLeave=28;
      yLeave=468;
    }
    if(clr==color(103,164,224)) {
      xLeave=468;
      yLeave=908;
    }
    if(clr==color(68,217,61)) {
      xLeave=468;
      yLeave=(28);
    }
    if(clr==color(242,240,92)) {
      xLeave=908;
      yLeave=468;
    }
    */
}
