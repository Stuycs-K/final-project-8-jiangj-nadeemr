color red=color(219,48,48);
color green = color(68,217,61);
color blue= color(103,164,224);
color yellow= color(242,240,92);
int countdown = 0;
int userTurn=0;
boolean waiting=false;
int roll;
static int STATE = -1;
ArrayList<User>players=new ArrayList<User>(4);
ArrayList<Token>onBoard=new ArrayList<Token>(16);
User one= new User(red);
User two = new User(green);
User three= new User(blue);
User four=new User(yellow);
void keyPressed() {
  STATE++;
  if(STATE > 4) {
    STATE = 0;
  }
  if(STATE==0&&players.size()==0){
    players.add(one);
  }
  if(STATE==1&&players.size()==1){
    players.add(two);
    players.add(three);
    players.add(four);
  }
}
void setup(){
  size(1400,935);
  x.createBoard();
  //players.add(one);
  //players.add(two);
  //players.add(three);
  //players.add(four);
  dice(0);
}
public void drawSquares(){
  fill(219,48,48);
    rect(55,55,385,385);
    fill(68,217,61);
    rect(495,55,385,385);
    fill(103,164,224);
    rect(55,495,385,385);
    fill(242,240,92);
    rect(495,495,385,385);
    fill(255,255,255);
    rect(97.5,97.5,295,295);
    rect(547.5,97.5,295,295);
    rect(97.5,547.5,295,295);
    rect(547.5,547.5,295,295);
    textSize(28);
    //text("Current Player: ", 1100, 400);
}
public void dice(int num) {
    rect(1100, 100, 220, 220, 28);
    fill(0);
    if(num==6||num==0) {
    circle(1150, 150, 25);
    circle(1270, 150, 25);
    circle(1150, 210, 25);
    circle(1270, 210, 25);
    circle(1150, 270, 25);
    circle(1270, 270, 25);
    } else if(num==1) {
      circle(1210, 210, 25);
    } else if(num==5) {
    circle(1150, 150, 25);
    circle(1270, 150, 25);
    circle(1150, 270, 25);
    circle(1270, 270, 25);
    circle(1210, 210, 25);
    } else if(num==4) {
    circle(1150, 150, 25);
    circle(1270, 150, 25);
    circle(1150, 270, 25);
    circle(1270, 270, 25);
    } else if(num==3) {
    circle(1150, 150, 25);
    circle(1210, 210, 25);
    circle(1270, 270, 25);
    } else if(num==2) {
    circle(1150, 150, 25);
    circle(1270, 270, 25);
    }
    fill(255);
}
Ludo x= new Ludo();
void draw() {
  rect(990,28,55,55);
  fill(0);
  text(STATE,1000,50);
  fill(255);
  int[][]board=x.getBoard();
    for(int i=0;i<17;i++){
      for(int j=0;j<17;j++){
        if(board[i][j]==0){
          rect(i*55,j*55,55,55);
        }
        if(board[i][j]==-2){
          fill(219,48,48);
          rect(i*55,j*55,55,55);
          fill(255,255,255);
      }
      if(board[i][j]==-3){
          fill(68,217,61);
          rect(i*55,j*55,55,55);
          fill(255,255,255);
      }
      if(board[i][j]==-4){
          fill(242,240,92);
          rect(i*55,j*55,55,55);
          fill(255,255,255);
      }
      if(board[i][j]==-5){
          fill(103,164,224);
          rect(i*55,j*55,55,55);
          fill(255,255,255);
      }
      fill(255,0,0);
      triangle(28,605,0,550,55,550);
      fill(0,0,255);
      triangle(550,935,550,880,605,908);
      fill(0,255,0);
      triangle(385,0,385,55,330,28);
      fill(255,255,0);
      triangle(935,385,880,385,908,330);
      fill(255,255,255);
    }
    }
    drawSquares();
  if(STATE == 0) {
    one.spawnTokens();
    //two.spawnTokens();
    //three.spawnTokens();
    //four.spawnTokens();
    /*Token j= one.returnToken();
    Token k = two.returnToken();
    Token l = three.returnToken();
    Token m=four.returnToken();*/
  }
    
    // STATE 1 - MULTIPLE TOKENS MOVE AROUND THE BOARD!
     else if(STATE>0) {
    one.spawnTokens();
    two.spawnTokens();
    three.spawnTokens();
    four.spawnTokens();
    if(userTurn == 4) userTurn = 0;
    /*Token j= one.returnToken();
    Token k = two.returnToken();
    Token l = three.returnToken();
    Token m=four.returnToken();*/
    }
}
public void chooseToken(User x,int y){
   int mouseXCor=mouseX;
   int mouseYCor=mouseY;
   x.changeCurrentToken(mouseXCor,mouseYCor);
   Token j=x.returnToken();
   j.move(y);
   j.checkTouching();
 }

public int diceRoll(){
    return 1+(int)(Math.random()*6);
  }


void mousePressed(){
    if(STATE!=0&&STATE!=4){
    if(userTurn==4){
      userTurn=0;
    }
    User currentUser=players.get(userTurn);
    if(mouseX>=1100 && mouseX<=1320 && mouseY>=100 && mouseY <= 320 &&waiting==false) {
    roll = diceRoll();
    x.setCurrentUser(currentUser);
    currentUser.updateDefeat();
    String clr = "";
    if(currentUser.colorOfToken == red) clr = "Red";
    if(currentUser.colorOfToken == green) clr = "Green";
    if(currentUser.colorOfToken == blue) clr = "Blue";
    if(currentUser.colorOfToken == yellow) clr = "Yellow";
    rect(1025,400,350,400);
    fill(0);
    text("SCOREBOARD", 1115, 435);
    // DISPLAY RED ON SCOREBOARD
    fill(red);
    textSize(18);
    text("Red Tokens", 1155, 500);
    fill(0);
    text("Finished\n      "+one.getNumOfTokensFinished(), 1050, 525);
    text("In Home Base\n         "+one.getNumOfTokensInHome(), 1150, 525);
    text("On Board\n         "+one.getNumOfTokensInPlay(), 1275, 525);
    // DISPLAY GREEN ON SCOREBOARD
    fill(green);
    textSize(18);
    text("Green Tokens", 1155, 575);
    fill(0);
    text("Finished\n      "+two.getNumOfTokensFinished(), 1050, 600);
    text("In Home Base\n         "+two.getNumOfTokensInHome(), 1150, 600);
    text("On Board\n         "+two.getNumOfTokensInPlay(), 1275, 600);
    // DISPLAY BLUE ON SCOREBOARD
    fill(blue);
    textSize(18);
    text("Blue Tokens", 1155, 650);
    fill(0);
    text("Finished\n      "+three.getNumOfTokensFinished(), 1050, 675);
    text("In Home Base\n         "+three.getNumOfTokensInHome(), 1150, 675);
    text("On Board\n         "+three.getNumOfTokensInPlay(), 1275, 675);
    // DISPLAY YELLOW ON SCOREBOARD
    fill(yellow);
    textSize(18);
    text("Yellow Tokens", 1155, 725);
    fill(0);
    text("Finished\n      "+four.getNumOfTokensFinished(), 1050, 750);
    text("In Home Base\n         "+four.getNumOfTokensInHome(), 1150, 750);
    text("On Board\n         "+four.getNumOfTokensInPlay(), 1275, 750);
    // CURRENT USER DISPLAY
    fill(currentUser.colorOfToken);
    textSize(26);
    text("Current Player: " + clr, 1085, 465);
    fill(255);
    dice(roll);
    waiting=true;
     if(roll!=6&&currentUser.getNumOfTokensInPlay()==0){
        waiting=false;
        userTurn++;
       if(userTurn ==4) userTurn =0;
      User newTurn = players.get(userTurn);
      rect(1025,400,350,400);
      fill(0);
      text("SCOREBOARD\n", 1115, 435);
      if(newTurn.colorOfToken == red) clr = "Red";
      if(newTurn.colorOfToken == green) clr = "Green";
      if(newTurn.colorOfToken == blue) clr = "Blue";
      if(newTurn.colorOfToken == yellow) clr = "Yellow";
      text("\nStatus: Waiting on user roll....", 1030, 455);
      fill(newTurn.colorOfToken);
      textSize(26);
      text(clr + ", it is your turn!", 1100, 550);
      fill(0);
      text("\nClick on the dice to roll!",1080,550);
      fill(255);
    }
    }
    if(currentUser.checkClicking(mouseX,mouseY,roll)&&waiting==true){
      chooseToken(currentUser,roll);
      currentUser.tokenFinished();
      userTurn++;
      if(userTurn ==4) userTurn =0;
      String clr = "";
      User newTurn = players.get(userTurn);
      rect(1025,400,350,400);
      fill(0);
      text("SCOREBOARD\n", 1115, 435);
      if(newTurn.colorOfToken == red) clr = "Red";
      if(newTurn.colorOfToken == green) clr = "Green";
      if(newTurn.colorOfToken == blue) clr = "Blue";
      if(newTurn.colorOfToken == yellow) clr = "Yellow";
      text("\nStatus: Waiting on user roll....", 1030, 455);
      fill(newTurn.colorOfToken);
      textSize(26);
      text(clr + ", it is your turn!", 1100, 550);
      fill(0);
      text("\nClick on the dice to roll!",1080,550);
      fill(255);
      countdown++;
      waiting=false;
    }
    }
    if(STATE==0){
    User currentUser=players.get(userTurn);
    if(mouseX>=1100 && mouseX<=1320 && mouseY>=100 && mouseY <= 320 &&waiting==false) {
    roll = diceRoll();
    x.setCurrentUser(currentUser);
    currentUser.updateDefeat();
    String clr = "";
    if(currentUser.colorOfToken == red) clr = "Red";
    if(currentUser.colorOfToken == green) clr = "Green";
    if(currentUser.colorOfToken == blue) clr = "Blue";
    if(currentUser.colorOfToken == yellow) clr = "Yellow";
    rect(1025,400,350,400);
    fill(0);
    text("SCOREBOARD", 1115, 435);
    // DISPLAY RED ON SCOREBOARD
    fill(red);
    textSize(18);
    text("Red Tokens", 1155, 500);
    fill(0);
    text("Finished\n      "+one.getNumOfTokensFinished(), 1050, 525);
    text("In Home Base\n         "+one.getNumOfTokensInHome(), 1150, 525);
    text("On Board\n         "+one.getNumOfTokensInPlay(), 1275, 525);
    // DISPLAY GREEN ON SCOREBOARD
    fill(green);
    textSize(18);
    text("Green Tokens", 1155, 575);
    fill(0);
    text("Finished\n      "+two.getNumOfTokensFinished(), 1050, 600);
    text("In Home Base\n         "+two.getNumOfTokensInHome(), 1150, 600);
    text("On Board\n         "+two.getNumOfTokensInPlay(), 1275, 600);
    // DISPLAY BLUE ON SCOREBOARD
    fill(blue);
    textSize(18);
    text("Blue Tokens", 1155, 650);
    fill(0);
    text("Finished\n      "+three.getNumOfTokensFinished(), 1050, 675);
    text("In Home Base\n         "+three.getNumOfTokensInHome(), 1150, 675);
    text("On Board\n         "+three.getNumOfTokensInPlay(), 1275, 675);
    // DISPLAY YELLOW ON SCOREBOARD
    fill(yellow);
    textSize(18);
    text("Yellow Tokens", 1155, 725);
    fill(0);
    text("Finished\n      "+four.getNumOfTokensFinished(), 1050, 750);
    text("In Home Base\n         "+four.getNumOfTokensInHome(), 1150, 750);
    text("On Board\n         "+four.getNumOfTokensInPlay(), 1275, 750);
    // CURRENT USER DISPLAY
    fill(currentUser.colorOfToken);
    textSize(26);
    text("Current Player: " + clr, 1085, 465);
    fill(255);
    dice(roll);
    waiting=true;
     if(roll!=6&&currentUser.getNumOfTokensInPlay()==0){
        waiting=false;
      User newTurn = players.get(userTurn);
      rect(1025,400,350,400);
      fill(0);
      text("SCOREBOARD\n", 1115, 435);
      if(newTurn.colorOfToken == red) clr = "Red";
      if(newTurn.colorOfToken == green) clr = "Green";
      if(newTurn.colorOfToken == blue) clr = "Blue";
      if(newTurn.colorOfToken == yellow) clr = "Yellow";
      text("\nStatus: Waiting on user roll....", 1030, 455);
      fill(newTurn.colorOfToken);
      textSize(26);
      text(clr + ", it is your turn!", 1100, 550);
      fill(0);
      text("\nClick on the dice to roll!",1080,550);
      fill(255);
    }
    }
    if(currentUser.checkClicking(mouseX,mouseY,roll)&&waiting==true){
      chooseToken(currentUser,roll);
      currentUser.tokenFinished();
      String clr = "";
      User newTurn = players.get(userTurn);
      rect(1025,400,350,400);
      fill(0);
      text("SCOREBOARD\n", 1115, 435);
      if(newTurn.colorOfToken == red) clr = "Red";
      if(newTurn.colorOfToken == green) clr = "Green";
      if(newTurn.colorOfToken == blue) clr = "Blue";
      if(newTurn.colorOfToken == yellow) clr = "Yellow";
      text("\nStatus: Waiting on user roll....", 1030, 455);
      fill(newTurn.colorOfToken);
      textSize(26);
      text(clr + ", it is your turn!", 1100, 550);
      fill(0);
      text("\nClick on the dice to roll!",1080,550);
      fill(255);
      countdown++;
      waiting=false;
    }
    }
    if(STATE==4){
    if(userTurn==4){
      userTurn=0;
    }
    User currentUser=players.get(userTurn);
    if(mouseX>=1100 && mouseX<=1320 && mouseY>=100 && mouseY <= 320 &&waiting==false) {
    roll = 1;
    x.setCurrentUser(currentUser);
    currentUser.updateDefeat();
    String clr = "";
    if(currentUser.colorOfToken == red) clr = "Red";
    if(currentUser.colorOfToken == green) clr = "Green";
    if(currentUser.colorOfToken == blue) clr = "Blue";
    if(currentUser.colorOfToken == yellow) clr = "Yellow";
    rect(1025,400,350,400);
    fill(0);
    text("SCOREBOARD", 1115, 435);
    // DISPLAY RED ON SCOREBOARD
    fill(red);
    textSize(18);
    text("Red Tokens", 1155, 500);
    fill(0);
    text("Finished\n      "+one.getNumOfTokensFinished(), 1050, 525);
    text("In Home Base\n         "+one.getNumOfTokensInHome(), 1150, 525);
    text("On Board\n         "+one.getNumOfTokensInPlay(), 1275, 525);
    // DISPLAY GREEN ON SCOREBOARD
    fill(green);
    textSize(18);
    text("Green Tokens", 1155, 575);
    fill(0);
    text("Finished\n      "+two.getNumOfTokensFinished(), 1050, 600);
    text("In Home Base\n         "+two.getNumOfTokensInHome(), 1150, 600);
    text("On Board\n         "+two.getNumOfTokensInPlay(), 1275, 600);
    // DISPLAY BLUE ON SCOREBOARD
    fill(blue);
    textSize(18);
    text("Blue Tokens", 1155, 650);
    fill(0);
    text("Finished\n      "+three.getNumOfTokensFinished(), 1050, 675);
    text("In Home Base\n         "+three.getNumOfTokensInHome(), 1150, 675);
    text("On Board\n         "+three.getNumOfTokensInPlay(), 1275, 675);
    // DISPLAY YELLOW ON SCOREBOARD
    fill(yellow);
    textSize(18);
    text("Yellow Tokens", 1155, 725);
    fill(0);
    text("Finished\n      "+four.getNumOfTokensFinished(), 1050, 750);
    text("In Home Base\n         "+four.getNumOfTokensInHome(), 1150, 750);
    text("On Board\n         "+four.getNumOfTokensInPlay(), 1275, 750);
    // CURRENT USER DISPLAY
    fill(currentUser.colorOfToken);
    textSize(26);
    text("Current Player: " + clr, 1085, 465);
    fill(255);
    dice(1);
    waiting=true;
     if(roll!=6&&currentUser.getNumOfTokensInPlay()==0){
        waiting=false;
        userTurn++;
       if(userTurn ==4) userTurn =0;
      User newTurn = players.get(userTurn);
      rect(1025,400,350,400);
      fill(0);
      text("SCOREBOARD\n", 1115, 435);
      if(newTurn.colorOfToken == red) clr = "Red";
      if(newTurn.colorOfToken == green) clr = "Green";
      if(newTurn.colorOfToken == blue) clr = "Blue";
      if(newTurn.colorOfToken == yellow) clr = "Yellow";
      text("\nStatus: Waiting on user roll....", 1030, 455);
      fill(newTurn.colorOfToken);
      textSize(26);
      text(clr + ", it is your turn!", 1100, 550);
      fill(0);
      text("\nClick on the dice to roll!",1080,550);
      fill(255);
    }
    }
    if(currentUser.checkClicking(mouseX,mouseY,roll)&&waiting==true){
      chooseToken(currentUser,roll);
      currentUser.tokenFinished();
      userTurn++;
      if(userTurn ==4) userTurn =0;
      String clr = "";
      User newTurn = players.get(userTurn);
      rect(1025,400,350,400);
      fill(0);
      text("SCOREBOARD\n", 1115, 435);
      if(newTurn.colorOfToken == red) clr = "Red";
      if(newTurn.colorOfToken == green) clr = "Green";
      if(newTurn.colorOfToken == blue) clr = "Blue";
      if(newTurn.colorOfToken == yellow) clr = "Yellow";
      text("\nStatus: Waiting on user roll....", 1030, 455);
      fill(newTurn.colorOfToken);
      textSize(26);
      text(clr + ", it is your turn!", 1100, 550);
      fill(0);
      text("\nClick on the dice to roll!",1080,550);
      fill(255);
      countdown++;
      waiting=false;
    }
    }
}
