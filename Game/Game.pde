static int STATE=-1;
import processing.sound.*;
SoundFile file;
SoundFile file2;
Ludo x= new Ludo();
color red=color(219, 48, 48);
color green = color(68, 217, 61);
color blue= color(103, 164, 224);
color yellow= color(242, 240, 92);
int countdown = 0;
int userTurn=0;
PFont game;
boolean waiting=false;
boolean gameDone=false;
boolean move = false;
boolean stillInAnimation=false;
boolean tokenPicked=false;
boolean diceAnimation=false;
boolean gameStarted=false;
boolean intermission=false;
boolean spawn=false;
boolean first=true;
boolean botTurn=false;
boolean botRolled=false;
boolean checkTokens=false;
boolean please=false;
int roll=-1;
int realRoll=-1;
int time=-1;
ArrayList<User>players=new ArrayList<User>(4);
ArrayList<Token>onBoard=new ArrayList<Token>(16);
Token movingToken;
User player;
Bot one; 
Bot two;
Bot three;
void keyPressed(){
  if(STATE==4){
    STATE=0;
  }
  else{
  STATE++;
  }
  System.out.println("STATE: "+STATE);
}
void setup() {
  game= createFont("game1.ttf", 38);
  file = new SoundFile(this, "dice.wav");
  file2 = new SoundFile(this, "clicked.wav");
  size(1400, 935);
  fill(red);
  textSize(50);
  background(237, 225, 185);
  //scoreboard rect
  fill(98, 145, 222);
  rect(935, 435, 465, 500);
  fill(255);
  x.createBoard();
  dice(0);
}
public void checkWinner(){
  if(players.get(userTurn).getNumOfTokensFinished()==4){
    User x=players.get(userTurn);
    fill(x.returnToken().getColor());
    text(x.getColorOfTokens()+" IS THE WINNER!!!!!!!",945,440);
    delay(2000);
    exit();
  }
}
public int diceRoll() {
  file.play();
  return 1+(int)(Math.random()*6);
}
public void botRoll(){
  file.play();
  int number=1+(int)(Math.random()*6);
  roll=number;
  realRoll=number;
}
public void drawSquares() {
  fill(219, 48, 48);
  rect(55, 55, 385, 385);
  fill(68, 217, 61);
  rect(495, 55, 385, 385);
  fill(103, 164, 224);
  rect(55, 495, 385, 385);
  fill(242, 240, 92);
  rect(495, 495, 385, 385);
  fill(255, 255, 255);
  rect(97.5, 97.5, 295, 295);
  rect(547.5, 97.5, 295, 295);
  rect(97.5, 547.5, 295, 295);
  rect(547.5, 547.5, 295, 295);
  textSize(28);
  //text("Current Player: ", 1100, 400);
}
public void dice(int num) {
  rect(1075, 100, 220, 220, 28);
  fill(0);
  if (num==6) {
    circle(1125, 150, 25);
    circle(1245, 150, 25);
    circle(1125, 210, 25);
    circle(1245, 210, 25);
    circle(1125, 270, 25);
    circle(1245, 270, 25);
  } else if (num==1) {
    circle(1185, 210, 25);
  } else if (num==5) {
    circle(1125, 150, 25);
    circle(1245, 150, 25);
    circle(1125, 270, 25);
    circle(1245, 270, 25);
    circle(1185, 210, 25);
  } else if (num==4) {
    circle(1125, 150, 25);
    circle(1245, 150, 25);
    circle(1125, 270, 25);
    circle(1245, 270, 25);
  } else if (num==3) {
    circle(1125, 150, 25);
    circle(1185, 210, 25);
    circle(1245, 270, 25);
  } else if (num==2) {
    circle(1125, 150, 25);
    circle(1245, 270, 25);
  }
  fill(255);
}
void draw() {
    fill(255);
  int[][]board=x.getBoard();
  for (int i=0; i<17; i++) {
    for (int j=0; j<17; j++) {
      if (board[i][j]==0) {
        rect(i*55, j*55, 55, 55);
      }
      if (board[i][j]==-2) {
        fill(219, 48, 48);
        rect(i*55, j*55, 55, 55);
        fill(255, 255, 255);
      }
      if (board[i][j]==-3) {
        fill(68, 217, 61);
        rect(i*55, j*55, 55, 55);
        fill(255, 255, 255);
      }
      if (board[i][j]==-4) {
        fill(242, 240, 92);
        rect(i*55, j*55, 55, 55);
        fill(255, 255, 255);
      }
      if (board[i][j]==-5) {
        fill(103, 164, 224);
        rect(i*55, j*55, 55, 55);
        fill(255, 255, 255);
      }
      fill(255, 0, 0);
      triangle(28, 605, 0, 550, 55, 550);
      fill(0, 0, 255);
      triangle(550, 935, 550, 880, 605, 908);
      fill(0, 255, 0);
      triangle(385, 0, 385, 55, 330, 28);
      fill(255, 255, 0);
      triangle(935, 385, 880, 385, 908, 330);
      fill(255, 255, 255);
    }
  }
  drawSquares();
  if(botTurn==false&&userTurn!=0){
    botTurn=true;
  }
  if(userTurn==0&&players.size()>0&&please==false){
    delay(1500);
   User current=players.get(userTurn);
     fill(98, 145, 222);
      rect(935, 435, 465, 500);
      textFont(game);
      fill(255);
      text("Scoreboard", 1020, 485);
      PFont georgia = createFont("Open Sans",28);
      textFont(georgia, 25);
      fill(current.colorOfToken);
      text("Click the dice to roll, " + current.getColorOfTokens(), 1010, 520);
      //text("Click on the dice\n for your turn!", 1065, 600);
      fill(player.colorOfToken);
      textSize(28);
      text(player.getColorOfTokens() + " Tokens", 970, 550);
      fill(255);
      textSize(18);
      text("Finished\n      "+player.getNumOfTokensFinished(), 970, 575);
      text("In Home Base\n         "+player.getNumOfTokensInHome(), 1120, 575);
      text("On Board\n         "+player.getNumOfTokensInPlay(), 1300, 575);
      fill(one.colorOfToken);
      textSize(28);
      text(one.getColorOfTokens() + " Tokens", 970, 650);
      fill(255);
      textSize(18);
      text("Finished\n      "+one.getNumOfTokensFinished(), 970, 675);
      text("In Home Base\n         "+one.getNumOfTokensInHome(), 1120, 675);
      text("On Board\n         "+one.getNumOfTokensInPlay(), 1300, 675);
      // second
      fill(two.colorOfToken);
      textSize(28);
      text(two.getColorOfTokens() + " Tokens", 970, 750);
      fill(255);
      textSize(18);
      text("Finished\n      "+two.getNumOfTokensFinished(), 970, 775);
      text("In Home Base\n         "+two.getNumOfTokensInHome(), 1120, 775);
      text("On Board\n         "+two.getNumOfTokensInPlay(), 1300, 775);
      // third bot
      fill(three.colorOfToken);
      textSize(28);
      text(three.getColorOfTokens() + " Tokens", 970, 850);
      fill(255);
      textSize(18);
      text("Finished\n      "+three.getNumOfTokensFinished(), 970, 875);
      text("In Home Base\n         "+three.getNumOfTokensInHome(), 1120, 875);
      text("On Board\n         "+three.getNumOfTokensInPlay(), 1300, 875);
 
      fill(255);
  }
  if (tokenPicked==true) {
    User currentUser=players.get(userTurn);
     Token j=currentUser.returnToken();
      currentUser.updateDefeat();
    if(roll<=j.returnSpaces()){
    if (roll==0) {
      stillInAnimation=false;
      tokenPicked=false;
      please=false;
      j.checkTouching();
       currentUser.checkBlock();
       currentUser.tokenFinished();
       currentUser.updateDefeat();
       checkWinner();
      userTurn++;
    } else if (roll==6) {
      if (j.checkHomeBase()==true) {
        j.specialMove(roll);
        roll=0;
        stillInAnimation=false;
        tokenPicked=false;
        please=false;
        checkWinner();
        userTurn++;
      }
      else{
        time = millis()+500;
        j.move();
        roll--;
      }
    } else if (roll>0&&millis()>time) {
      time=millis()+500;
      stillInAnimation=true;
      j.move();
      roll--;
    }
  }
  if(roll>j.returnSpaces()){
    userTurn++;
    tokenPicked=false;
    please=false;
  }
  }
  if(botTurn==true){
    User current=players.get(userTurn);
    Bot currentBot=(Bot)current;
    if(botRolled==false){
      fill(98, 145, 222);
      rect(935, 435, 465, 500);
      textFont(game);
      fill(255);
      text("Scoreboard", 1020, 485);
      PFont georgia = createFont("Open Sans",28);
      textFont(georgia, 25);
      fill(current.colorOfToken);
      text("Rolling dice For: " + current.getColorOfTokens(), 1065, 520);
      //text("Click on the dice\n for your turn!", 1065, 600);
      fill(player.colorOfToken);
      textSize(28);
      text(player.getColorOfTokens() + " Tokens", 970, 550);
      fill(255);
      textSize(18);
      text("Finished\n      "+player.getNumOfTokensFinished(), 970, 575);
      text("In Home Base\n         "+player.getNumOfTokensInHome(), 1120, 575);
      text("On Board\n         "+player.getNumOfTokensInPlay(), 1300, 575);
      fill(one.colorOfToken);
      textSize(28);
      text(one.getColorOfTokens() + " Tokens", 970, 650);
      fill(255);
      textSize(18);
      text("Finished\n      "+one.getNumOfTokensFinished(), 970, 675);
      text("In Home Base\n         "+one.getNumOfTokensInHome(), 1120, 675);
      text("On Board\n         "+one.getNumOfTokensInPlay(), 1300, 675);
      // second
      fill(two.colorOfToken);
      textSize(28);
      text(two.getColorOfTokens() + " Tokens", 970, 750);
      fill(255);
      textSize(18);
      text("Finished\n      "+two.getNumOfTokensFinished(), 970, 775);
      text("In Home Base\n         "+two.getNumOfTokensInHome(), 1120, 775);
      text("On Board\n         "+two.getNumOfTokensInPlay(), 1300, 775);
      // third bot
      fill(three.colorOfToken);
      textSize(28);
      text(three.getColorOfTokens() + " Tokens", 970, 850);
      fill(255);
      textSize(18);
      text("Finished\n      "+three.getNumOfTokensFinished(), 970, 875);
      text("In Home Base\n         "+three.getNumOfTokensInHome(), 1120, 875);
      text("On Board\n         "+three.getNumOfTokensInPlay(), 1300, 875);
      fill(255);
      delay(1500);
      if(STATE==0){
      botRoll();
      }
      if(STATE==1||STATE==3){
        roll=6;
        realRoll=6;
      }
      if(STATE==2){
        roll=1;
        realRoll=1;
      }
      if(STATE==4){
        roll=2;
        realRoll=2;
      }
      dice(realRoll);
      //bot rolls
      currentBot.safety();
  
        User newplr = players.get(userTurn);
            fill(98, 145, 222);
            rect(935, 435, 465, 500);
            textFont(game);
            fill(255);
            text("Scoreboard", 1020, 485);
            textFont(georgia, 25);
            fill(newplr.colorOfToken);
            text("Current User: " + newplr.getColorOfTokens(), 1065, 520);
            //text("Click on the dice\n for your turn!", 1065, 600);
            fill(player.colorOfToken);
            textSize(28);
            text(player.getColorOfTokens() + " Tokens", 970, 550);
            fill(255);
            textSize(18);
            text("Finished\n      "+player.getNumOfTokensFinished(), 970, 575);
            text("In Home Base\n         "+player.getNumOfTokensInHome(), 1120, 575);
            text("On Board\n         "+player.getNumOfTokensInPlay(), 1300, 575);
            fill(one.colorOfToken);
            textSize(28);
            text(one.getColorOfTokens() + " Tokens", 970, 650);
            fill(255);
            textSize(18);
            text("Finished\n      "+one.getNumOfTokensFinished(), 970, 675);
            text("In Home Base\n         "+one.getNumOfTokensInHome(), 1120, 675);
            text("On Board\n         "+one.getNumOfTokensInPlay(), 1300, 675);
            // second
            fill(two.colorOfToken);
            textSize(28);
            text(two.getColorOfTokens() + " Tokens", 970, 750);
            fill(255);
            textSize(18);
            text("Finished\n      "+two.getNumOfTokensFinished(), 970, 775);
            text("In Home Base\n         "+two.getNumOfTokensInHome(), 1120, 775);
            text("On Board\n         "+two.getNumOfTokensInPlay(), 1300, 775);
            // third bot
            fill(three.colorOfToken);
            textSize(28);
            text(three.getColorOfTokens() + " Tokens", 970, 850);
            fill(255);
            textSize(18);
            text("Finished\n      "+three.getNumOfTokensFinished(), 970, 875);
            text("In Home Base\n         "+three.getNumOfTokensInHome(), 1120, 875);
            text("On Board\n         "+three.getNumOfTokensInPlay(), 1300, 875);
            //fill(bot.colorOfToken);
            //textFont(georgia, 38);
            //text("Upcoming User: " + bot.getColorOfTokens(), 980, 780);
            fill(255);
      botRolled=true;
    }
    if(roll!=6&&currentBot.getNumOfTokensInHome()==4){
        botRolled=false;
        tokenPicked=false;
        roll=0;
        userTurn++;
      } 
      else if(roll==6&&currentBot.getNumOfTokensInHome()!=0){
          Token j=currentBot.tokenInHome();
          j.specialMove(roll); // bot spawns
          roll=0;
          stillInAnimation=false;
          botRolled=false;
          tokenPicked=false;
          userTurn++;
      }
     else if(roll!=6&&currentBot.getNumOfTokensInHome()<=3||roll==6&&currentBot.getNumOfTokensInHome()==0){
       if(tokenPicked==false){
         movingToken=currentBot.randomToken();
         currentBot.updateDefeat();
         currentBot.tokenFinished();
        currentBot.checkBlock();
         tokenPicked=true;
       }
       if(roll<=movingToken.returnSpaces()&&roll!=0){  
          time=millis()+500;
          movingToken.move(); //bot moves
          roll--;
         if(roll==0){
         currentBot.returnToken().checkTouching();
         currentBot.updateDefeat();
         currentBot.tokenFinished();
        currentBot.checkBlock();
        checkWinner();
            stillInAnimation=false;
            botRolled=false;
            tokenPicked=false;
        
            userTurn++;
        }
      }
       }
       
        
    
  if(roll>currentBot.returnToken().returnSpaces()){
    botRolled=false;
    userTurn++;
  }
   if(userTurn==4){
     userTurn=0;
     botTurn=false;
     tokenPicked=false;
     please=false;
   }
  }
          
    
   
    
  textSize(10);
  textFont(game);
  fill(red);
  text("L", 1100, 34);
  fill(green);
  text("u", 1138, 34);
  fill(blue);
  text("d", 1176, 34);
  fill(255, 242, 0);
  text("o", 1214, 34);
  fill(255);
  if(gameStarted==false&&intermission==false){
  PFont f = createFont("Open Sans", 38);
  textFont(f);
  PFont georgia = createFont("Georgia",28);
  fill(0);
  text("Gameboard", 1070, 65);
  textFont(georgia);
  text("Welcome, player!\n", 1075, 475);
  text("Please click Play to begin.", 1035, 525);
  fill(green);
  rect(1095, 635, 175, 75);
  fill(0);
  text("Play", 1160, 680);
  fill(255);
  }
  if (mousePressed&&mouseX>=1100 && mouseX<=1285 && mouseY>=635 && mouseY <= 710 &&intermission==false) {
    fill(98, 145, 222);
    rect(935, 435, 465, 500);
    fill(200);
    text("Please pick your color!", 1045, 500);
    fill(red);
    rect(985, 610, 145, 75);
    fill(green);
    rect(1235, 610, 145, 75);
    fill(blue);
    rect(985, 810, 145, 75);
    fill(yellow);
    rect(1235, 810, 145, 75);
    fill(0);
    text("Red", 1035, 655);
    text("Green", 1275, 655);
    text("Blue", 1030, 855);
    text("Yellow", 1270, 855);
    fill(255);
    intermission=true;
  }
  if(mousePressed&&mouseX>=985&&mouseX<=1130&&mouseY>=610&&mouseY<=685&&intermission) {
    fill(98, 145, 222);
    rect(935, 435, 465, 500);
    player=new User(red);
    one=new Bot(green);
    two=new Bot(blue);
    three=new Bot(yellow);
    spawn=true;
    file2.play();
  }
   if(mousePressed&&mouseX>=1235&&mouseX<=1380&&mouseY>=610&&mouseY<=685&&intermission) {
    fill(98, 145, 222);
    rect(935, 435, 465, 500);
    player=new User(green);
    one=new Bot(blue);
    two=new Bot(yellow);
    three=new Bot(red);
    spawn=true;
    file2.play();
  }
  if(mousePressed&&mouseX>=985&&mouseX<=1130&&mouseY>=810&&mouseY<=885&&intermission) {
    fill(98, 145, 222);
    rect(935, 435, 465, 500);
    player=new User(blue);
    one=new Bot(yellow);
    two=new Bot(red);
    three=new Bot(green);
    spawn=true;
    file2.play();
  }
  if(mousePressed&&mouseX>=1235&&mouseX<=1380&&mouseY>=810&&mouseY<=885&&intermission) {
    fill(98, 145, 222);
    rect(935, 435, 465, 500);
    player=new User(yellow);
    one=new Bot(red);
    two=new Bot(green);
    three=new Bot(blue);
    spawn=true;
    file2.play();
  }
  if(spawn) {
  players.add(player);
  players.add(one);
  players.add(two);
  players.add(three);
   player.spawnTokens();
  one.spawnTokens();
  two.spawnTokens();
  three.spawnTokens();
  gameStarted=true;
  }
  if (diceAnimation) {
    for (int i = 1; i <=6; i++) {
      dice(i);
      if (millis()>time) {
        time=millis()+3000;
      }
    }
    dice(realRoll);
    diceAnimation = false;
  }
  
}

public void chooseToken(User x) {
  int mouseXCor=mouseX;
  int mouseYCor=mouseY;
  x.changeCurrentToken(mouseXCor, mouseYCor);
  tokenPicked=true;
}



void mousePressed() {
 // gameStarted=true;
 if(gameStarted==true&&botTurn==false) {
  if (stillInAnimation==false) {
    if (userTurn==players.size()) {
      userTurn=0;
    }
    User currentUser=players.get(userTurn);
     currentUser.safety();
    if (mouseX>=1075 && mouseX<=1295 && mouseY>=100 && mouseY<= 320 &&waiting==false) {
      if(STATE==0){
      roll = diceRoll();
      realRoll=roll;
      }
      if(STATE==1||STATE==3){
        roll=6;
        realRoll=6;
      }
      if(STATE==2){
        roll=1;
        realRoll=1;
      }
      if(STATE==4){
        roll=2;
        realRoll=2;
        currentUser.changeTokensFinished(3);
       currentUser.changeTokensInHome(0);
       
      }
      please=true;
      x.setCurrentUser(currentUser);
fill(98, 145, 222);
      rect(935, 435, 465, 500);
      textFont(game);
      fill(255);
      text("Scoreboard", 1020, 485);
      PFont georgia = createFont("Open Sans",28);
      textFont(georgia, 25);
      fill(player.colorOfToken);
      text("Current User: " + player.getColorOfTokens(), 1065, 520);
      //text("Click on the dice\n for your turn!", 1065, 600);
      fill(player.colorOfToken);
      textSize(28);
      text(player.getColorOfTokens() + " Tokens", 970, 550);
      fill(255);
      textSize(18);
      text("Finished\n      "+player.getNumOfTokensFinished(), 970, 575);
      text("In Home Base\n         "+player.getNumOfTokensInHome(), 1120, 575);
      text("On Board\n         "+player.getNumOfTokensInPlay(), 1300, 575);
      fill(one.colorOfToken);
      textSize(28);
      text(one.getColorOfTokens() + " Tokens", 970, 650);
      fill(255);
      textSize(18);
      text("Finished\n      "+one.getNumOfTokensFinished(), 970, 675);
      text("In Home Base\n         "+one.getNumOfTokensInHome(), 1120, 675);
      text("On Board\n         "+one.getNumOfTokensInPlay(), 1300, 675);
      // second
      fill(two.colorOfToken);
      textSize(28);
      text(two.getColorOfTokens() + " Tokens", 970, 750);
      fill(255);
      textSize(18);
      text("Finished\n      "+two.getNumOfTokensFinished(), 970, 775);
      text("In Home Base\n         "+two.getNumOfTokensInHome(), 1120, 775);
      text("On Board\n         "+two.getNumOfTokensInPlay(), 1300, 775);
      // third bot
      fill(three.colorOfToken);
      textSize(28);
      text(three.getColorOfTokens() + " Tokens", 970, 850);
      fill(255);
      textSize(18);
      text("Finished\n      "+three.getNumOfTokensFinished(), 970, 875);
      text("In Home Base\n         "+three.getNumOfTokensInHome(), 1120, 875);
      text("On Board\n         "+three.getNumOfTokensInPlay(), 1300, 875);
      fill(255);
      diceAnimation = true;
      time=millis()+500;
      dice(roll);
      waiting=true;
      if (roll!=6&&currentUser.getNumOfTokensInPlay()==0) {
        waiting=false;
        userTurn++;
        if (userTurn ==4) {
          userTurn =0;
        }
      }
    }
    if (currentUser.checkClicking(mouseX, mouseY, roll)&&waiting==true) {
      chooseToken(currentUser);
     

      if (currentUser.returnUserFinished()) {
        gameDone=true;
      }
      if (userTurn ==4) {
        userTurn =0;
      }
      String clr = "";
      User newTurn = players.get(userTurn);
      waiting=false;
    }
  }
 }
}
