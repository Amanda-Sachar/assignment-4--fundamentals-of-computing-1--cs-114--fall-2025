int row;
int col;
int valueComputerChosen;
int rand;
int turnCount;

IntList slotsOpen;

//when moving initialzation into set up nothing was able to access the following. What do i do? set up is the constructer(i think?) so should have initialization there?
char[] rowOne={'_','_','_'};
char[] rowTwo={'_','_','_'};
char[] rowThree={'_','_','_'};
char[][]boardState={rowOne,rowTwo,rowThree};

boolean isPlayersTurn;
boolean gameOver;
boolean xHasWon;
boolean oHasWon;

void setup() {
  isPlayersTurn=false;
  slotsOpen=new IntList();
  gameOver=false;
  xHasWon=false;
  oHasWon=false;
  size(500, 500);
  for (int valueToGive=0;valueToGive<=8;valueToGive++){
    slotsOpen.set(valueToGive,valueToGive);
  }
}

void draw() {
  if(gameOver==false&&oHasWon==false){
    if(isPlayersTurn==false){
      ChoosingComputerMove();
      ComputerMakeMove();
    }
    grid();
    checkForAnyVictory();
   
    if(turnCount>=9&&xHasWon==false&&oHasWon==false){
      gameOver=true;
      println("Game Over, No winners");
      
    }
  }
}

void keyReleased(){
  if(gameOver==false){
    if (isPlayersTurn){
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
        ++turnCount;
        //sets the value of the slot played to 10, so it cannot be used
        slotsOpen.set(Character.getNumericValue(key),10);
        println("The Game is Still Ongoing");
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
    //10 is used to say that the slot has something in it, so it cant be changed
    valueComputerChosen=slotsOpen.get(rand);
  }
  else{
    ChoosingComputerMove();
  }
}

void ComputerMakeMove(){
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
  slotsOpen.set(rand,10);
  ChangeCurrentPlayer();
}

void checkForAnyVictory(){
  for(int setBeingChecked=0;setBeingChecked<3;setBeingChecked++){
    //checks for horizantal win
    if(boardState[0][setBeingChecked]==boardState[1][setBeingChecked]&& boardState[0][setBeingChecked]==boardState[2][setBeingChecked] && boardState[0][setBeingChecked]!='_'){
      if(boardState[0][setBeingChecked]=='O'){
        println("Game Over, O Has Won");
        gameOver=true;
        oHasWon=true;
      }
      else{
        println("Game Over, X Has Won");
        gameOver=true;
        xHasWon=true;
      }
    }
    //checks for vertical win
    if(boardState[setBeingChecked][0]==boardState[setBeingChecked][1]&& boardState[setBeingChecked][0]==boardState[setBeingChecked][2] && boardState[setBeingChecked][0]!='_'){
      if(boardState[setBeingChecked][0]=='O'){
        println("Game Over, O Has Won");
        gameOver=true;
        oHasWon=true;
      }
      else{
        println("Game Over, X Has Won");
        gameOver=true;
        xHasWon=true;
      }
    }
  }
  //checks for diagonal win
  if(boardState[0][0]==boardState[1][1]&& boardState[0][0]==boardState[2][2] && boardState[0][0]!='_'||
    boardState[0][2]==boardState[1][1]&& boardState[0][2]==boardState[2][0] && boardState[1][1]!='_'){
    if(boardState[1][1]=='O'){
        println("Game Over, O Has Won");
        gameOver=true;
        oHasWon=true;
      }
      else{
        println("Game Over, X Has Won");
        gameOver=true;
        xHasWon=true;
      }
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
