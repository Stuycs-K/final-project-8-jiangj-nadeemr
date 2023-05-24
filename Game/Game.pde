Ludo x= new Ludo();
color red=color(219,48,48);
User one= new User(red);
void setup(){
  size(1400,935);
  x.createBoard();
}
void draw() {
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
          fill(103,164,224);
          rect(i*55,j*55,55,55);
          fill(255,255,255);
      }
      if(board[i][j]==-5){
          fill(242,240,92);
          rect(i*55,j*55,55,55);
          fill(255,255,255);
      }
    }
    }
    
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
    for(int i=0;i<4;i++){
      one.newCurrentToken(i);
      Token j= one.returnToken();
      int x= j.returnXSpawn();
      int y= j.returnYSpawn();
      j.spawn(x,y);
    }
      
      
    
}
