//import java.util.*;
//import java.util.concurrent.TimeUnit ;
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
    isBlock=false;
    spacesAwayFromTriangle=70;
  }
  /* Checks if a token reached home base. If so, remove the token
  from the game, increase User's numOfTokensFinished
  */
  public boolean checkIfDone(int spacesAwayFromTriangle) {
    return spacesAwayFromTriangle==0;
  }
  public void closerTriangle(int x){
    spacesAwayFromTriangle=spacesAwayFromTriangle-x;
  }
  public int returnSpaces(){
    return spacesAwayFromTriangle;
  }
  /* Checks if you're touching an enemy/friendly token. If 
  touching an enemy token, send enemy token home.
  */
  public String getColorOfTokens() {
    String clr = "";
    if(tokenColor==red) {
    clr = "Red";
    }
   if(tokenColor==blue) {
    clr = "Blue";
    }
   if(tokenColor==yellow) {
    clr = "Yellow";
    }
   if(tokenColor==green) {
    clr = "Green";
    }
    return clr;
  }
  public void checkTouching() {
    onBoard.remove(this);
    for(int i = 0; i < onBoard.size(); i++) {
      if(onBoard.get(i).returnXSpawn() == xspawn && onBoard.get(i).returnYSpawn() == yspawn) {
        if(onBoard.get(i).getColor()!=this.getColor()){
          System.out.println("YOURE ON THE SAME SQUARE!!!!");
          if(onBoard.get(i).isBlock()==false){
        onBoard.get(i).returnToHomeYard();
        System.out.println(this.getColorOfTokens()+this.returnNumToken()+" sends back "+onBoard.get(i).getColorOfTokens()+onBoard.get(i).returnNumToken());
        onBoard.remove(i);
          }
          else if(onBoard.get(i).isBlock()==true){
            this.returnToHomeYard();
          }
        
    }
      }
   }
    onBoard.add(this);

  }
  public void safetyCheck(){
    if(this.checkHomeBase()==false){
    onBoard.remove(this);
    for(int i=0;i<onBoard.size();i++){
      if(onBoard.get(i).returnXSpawn()==xspawn&&onBoard.get(i).returnYSpawn()==yspawn){
        if(onBoard.get(i).getColor()!=this.getColor()){
          if(this.isBlock()==false){
            this.returnToHomeYard();
            System.out.println(onBoard.get(i).getColorOfTokens()+onBoard.get(i).returnNumToken()+" sends back "+this.getColorOfTokens()+this.returnNumToken());
            onBoard.remove(this);
          }
          else if(this.isBlock()==true){
            onBoard.get(i).returnToHomeYard();
            onBoard.remove(onBoard.get(i));
          }
        }
      }
    }
   onBoard.add(this);
  }
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
  public void specialMove(int num) {
  if(inHomeBase==true&&num==6){
    if(tokenColor==red) {
      xLeave=28;
      yLeave=578;    }
   if(tokenColor==blue) {
      xLeave=578;
      yLeave=908;    }
   if(tokenColor==yellow) {
      xLeave=908;
      yLeave=358;
    }
   if(tokenColor==green) {
      xLeave=358;
      yLeave=(28);
    }
    changeLeave(tokenColor);
      xspawn=xLeave;
      yspawn=yLeave;
      inHomeBase=false;
    }
  }
  public void move(){
    if(inHomeBase==false){
      spacesAwayFromTriangle--;
    if(getColor()==red&&xspawn==28&&yspawn==468){
      finalTurn=true;
    }
    if(getColor()==green&&xspawn==468&&yspawn==28){
      finalTurn=true;
    }
    if(getColor()==yellow&&xspawn==908&&yspawn==468){
      finalTurn=true;
    }
    if(getColor()==blue&&xspawn==468&&yspawn==908){
      finalTurn=true;
    }
    if(finalTurn==true){
      if(getColor()==red){
        xspawn=xspawn+55;
        if(xspawn==468){
          finished=true;
          System.out.println("finished!!!");
        }
      }
 
      if(getColor()==green){
        yspawn=yspawn+55;
        if(yspawn==468){
          finished=true;
        }
        }
      
      if(getColor()==yellow){
        xspawn=xspawn-55;
        if(xspawn==468){
          finished=true;
        }
        }
      
      if(getColor()==blue){
        
        yspawn=yspawn-55;
        if(yspawn==468){
          finished=true;
        }
        
      }
    }
 
    else if(xspawn+55 < 935 && ((yspawn==0) || (yspawn + 55) >= 935)) {
         xspawn= xspawn+55;
    } else if(xspawn+55 >=935 && yspawn-55 >=0) { 
         yspawn = yspawn-55;
    } else if(yspawn-55 <= 0 && xspawn-55 >=0) {
         xspawn = xspawn-55;
    } else {
         yspawn = yspawn+55;
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
  public boolean isBlock(){
    return isBlock;
  }
  public void changeBlock(boolean x){
    isBlock=x;
  }
  public int returnNumToken(){
    return numToken;
  }
  public void changeLeave(color clr){
    if(STATE==0){
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
    }
    if(STATE==3){
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
    }
    if(STATE==1){
      if(clr==red){
        xLeave=28;
        yLeave=578;
      }
      if(clr==blue){
        xLeave=28;
        yLeave=523;
      }
      if(clr==yellow){
        xLeave=28;
        yLeave=633;
      }
      if(clr==green){
        xLeave=28;
        yLeave=688;
      }
    }
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
