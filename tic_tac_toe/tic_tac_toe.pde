int row;
int col;
boolean isPlayersTurn=false;
int[] horSetOne={0,1,2};
int[] horSetTwo={3,4,5};
int[] horSetThree={6,7,8};

int[] verSetOne={horSetOne[0],horSetTwo[0],horSetThree[0]};
int[] verSetTwo={horSetOne[1],horSetTwo[1],horSetThree[0]};
int[] verSetThree={horSetOne[2],horSetTwo[2],horSetThree[0]};

int[] diagSetOne={0,4,8};
int[] diagSetTwo={2,4,6};
IntList slotsOpen;
int valueComputerChosen;
int rand;

char[] rowOne={'_','_','_'};
char[] rowTwo={'_','_','_'};
char[] rowThree={'_','_','_'};
char[][]boardState={rowOne,rowTwo,rowThree};
int turnCount=0;

boolean gameOver=false;
boolean XHasWon=false;
boolean OHasWon=false;

//Have sets be blank, then as played update them?
//have one grid and use a double for loop?,
/*check if array[0][0]==array[1][0], then if array[1][0]==array[2][0]
while x<=2 check if !!find if can make ths check twice!!(array[x][y]==array[++x][y]), runs next,
while y<=2 check if array[x][y]==array[x][++y]
if fails, set x & y==0

methodCalledAfterMoveIsMade(){
  H CHECK
  for(int x=0, y=0;y<=2;y++){
    if (array[x][y]==array[++x][y] && array[x][y]==array[++x][y]){
      currentPlayerWins
    }
  V CHECK
  for(int x=0, y=0;x<=2;x++){
    if (array[x][y]==array[x][++y] && array[x][y]==array[x][++y]){
      currentPlayerWins
    }
  }
  D CHECK,
      one has only x, x=0 and increase: array[x][x]==array[++x][x] X2, other has x=2 to start and array[x][2-x]==array[--x][2-x] X2
  x=0;
    if (array[x][x]==array[++x][x] && array[x][x]==array[++x][x]){
      currentPlayerWins
    }
  x=0;
    if (array[x][2-x]==array[--x][2-x] && array[x][2-x]==array[--x][2-x]){
      currentPlayerWins
    }
}
*/
void setup() {
  slotsOpen=new IntList();
  size(500, 500);
  println(CIRCRADIUS);
  for (int valueToGive=0;valueToGive<=8;valueToGive++){
    slotsOpen.set(valueToGive,valueToGive);
    println(slotsOpen.get(valueToGive));
  }

}

void draw() {
  if (gameOver==false){
    if(isPlayersTurn==false){
      ChoosingComputerMove();
      ComputerMakeMove();
    }
    grid();
     if(XHasWon==false)
      checkForOVictory();
    if(OHasWon==false)
      checkForXVictory();
   
    else if(turnCount>=9){
      gameOver=true;
      println("Game Over, No winners");
      
    }
  }
}
void boardPrint(){
  println("the turn count is  "+turnCount);
  for(int row=0;row<3;row++){
    println("");
  for(int col=0;col<3;col++){
      print(boardState[row][col]+" ");
    }
  }
  
}

void keyReleased(){
  if(gameOver==false){
    if (isPlayersTurn){
      //println("You have chosen slot "+key);
      if (slotsOpen.hasValue(Character.getNumericValue(key))){
        if (key=='0'){
          shapes(0,0);
        }
        else if (key=='1'){
          shapes(1,0);
        }
        else if (key=='2'){
          shapes(2,0);
        }
        else if (key=='3'){
          shapes(0,1);
        }
        else if (key=='4'){
          shapes(1,1);
        }
        else if (key=='5'){
          shapes(2,1);
        }
        else if (key=='6'){
          shapes(0,2);
        }
        else if (key=='7'){
          shapes(1,2);
        }
        else if (key=='8'){
          shapes(2,2);
        }
        boardPrint();
        ++turnCount;
        slotsOpen.set(Character.getNumericValue(key),10);
        //println(slotsOpen);
        ChangeCurrentPlayer();
      }
      else{
        ErrorWasMade();
      }
    }
  }
  else{
    println("The Game Is Over");
  }
  
}
void ChoosingComputerMove(){
  rand=int(random(0,9));
  if (slotsOpen.get(rand)!=10){
    valueComputerChosen=slotsOpen.get(rand);
  }
  else{
    ChoosingComputerMove();
  }
}

void ComputerMakeMove(){
    //println("The computer has chosen slot "+valueComputerChosen);
    if (valueComputerChosen==0){
      shapes(0,0);
    }
    else if (valueComputerChosen==1){
      shapes(1,0);
    }
    else if (valueComputerChosen==2){
      shapes(2,0);
    }
    else if (valueComputerChosen==3){
      shapes(0,1);
    }
    else if (valueComputerChosen==4){
      shapes(1,1);
    }
    else if (valueComputerChosen==5){
      shapes(2,1);
    }
    else if (valueComputerChosen==6){
      shapes(0,2);
    }
    else if (valueComputerChosen==7){
      shapes(1,2);
    }
    else if (valueComputerChosen==8){
      shapes(2,2);
    }
    turnCount++;
    boardPrint();
    slotsOpen.set(rand,10);
    //println(slotsOpen);
   ChangeCurrentPlayer();
}
void checkForXVictory(){
//for(int row=0;row<3;row++){
//    println("");
//  for(int col=0;col<3;col++){
//      print(BoardState[row][col]+" ");
//    }
//  }
  for(int x=0;x<3;x++){
    if(boardState[0][x]==boardState[1][x]&& boardState[0][x]==boardState[2][x] && boardState[0][x]=='X'){
      println("Game Over, X Has Won");
      gameOver=true;
      XHasWon=true;
    }
    if(boardState[x][0]==boardState[x][1]&& boardState[x][0]==boardState[x][2] && boardState[x][0]=='X'){
      println("Game Over, X Has Won");
      gameOver=true;
      XHasWon=true;
    }
  }
    if(boardState[0][0]==boardState[1][1]&& boardState[0][0]==boardState[2][2] && boardState[0][0]=='X'||
    boardState[0][2]==boardState[1][1]&& boardState[0][2]==boardState[2][0] && boardState[1][1]=='X'){
      println("Game Over, X Has Won");
      gameOver=true;
      XHasWon=true;
    }

}
void checkForOVictory(){
//for(int row=0;row<3;row++){
//    println("");
//  for(int col=0;col<3;col++){
//      print(BoardState[row][col]+" ");
//    }
//  }
  for(int x=0;x<3;x++){
    if(boardState[0][x]==boardState[1][x]&& boardState[0][x]==boardState[2][x] && boardState[0][x]=='O'){
      println("Game Over, O Has Won");
      gameOver=true;
      OHasWon=true;
    }
    if(boardState[x][0]==boardState[x][1]&& boardState[x][0]==boardState[x][2] && boardState[x][0]=='O'){
      println("Game Over, O Has Won");
      gameOver=true;
      OHasWon=true;
    }
  }
  if(boardState[0][0]==boardState[1][1]&& boardState[0][0]==boardState[2][2] && boardState[0][0]=='O'||
   boardState[0][2]==boardState[1][1]&& boardState[0][2]==boardState[2][0] && boardState[1][1]=='O'){
    println("Game Over, O Has Won");
    gameOver=true;
    OHasWon=true;
  }
}

void ErrorWasMade(){
  println("Invalid input, try again");
}
void ChangeCurrentPlayer(){
  if (isPlayersTurn){
    isPlayersTurn=false;
  }
  else{
    isPlayersTurn=true;
  }
}
