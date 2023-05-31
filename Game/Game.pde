Ludo x= new Ludo();
color red=color(219,48,48);
color green = color(68,217,61);
color blue= color(103,164,224);
color yellow= color(242,240,92);
int countdown = 0;
int userTurn=0;
ArrayList<User>players=new ArrayList<User>(4);
User one= new User(red);
User two = new User(green);
User three= new User(blue);
User four=new User(yellow);
void setup(){
  size(1400,935);
  x.createBoard();
  players.add(one);
  players.add(two);
  players.add(three);
  players.add(four);
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
void draw() {
   if(countdown<10000000) {
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
    }
    }
    drawSquares();
    one.spawnTokens();
    two.spawnTokens();
    three.spawnTokens();
    four.spawnTokens();
    if(userTurn == 4) userTurn = 0;
    /*Token j= one.returnToken();
    Token k = two.returnToken();
    Token l = three.returnToken();
    Token m=four.returnToken();*/
    } else {
      print("game done!");
    }
}
void mousePressed(){
    int mouseXCor=mouseX;
    int mouseYCor=mouseY;
    if(userTurn==4){
      userTurn=0;
    }
    if(mouseX>=1100 && mouseX<=1320 && mouseY>=100 && mouseY <= 320) {
    User currentUser=players.get(userTurn);
    x.setCurrentUser(currentUser);
    String clr = "";
    System.out.println(currentUser.colorOfToken);
    if(currentUser.colorOfToken == red) clr = "Red";
    if(currentUser.colorOfToken == green) clr = "Green";
    if(currentUser.colorOfToken == blue) clr = "Blue";
    if(currentUser.colorOfToken == yellow) clr = "Yellow";
    rect(1090,400,300,50);
    fill(currentUser.colorOfToken);
    text("Current Player: " + clr, 1120, 435);
    fill(255);
    currentUser.changeCurrentToken(mouseXCor,mouseYCor);
    Token j=currentUser.returnToken();
    int roll = currentUser.diceRoll();
    dice(roll);
    j.move(roll);
    userTurn++;
    countdown++;
    }
}


   

      
      
    
