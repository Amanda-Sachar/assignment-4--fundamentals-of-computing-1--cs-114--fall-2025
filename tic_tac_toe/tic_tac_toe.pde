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
char[] slotsOpen=new char[8];
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
  size(500, 500);
  println(CIRCRADIUS);
  for (int valueToGive=0;valueToGive<8;valueToGive++){
    slotsOpen[valueToGive]=Integer.toString(valueToGive).charAt(0);
  }
  
}

void draw() {
  grid();
}

void keyReleased(){
  //horizLocation
  if (slotsOpen[key]!=' '){
  slotsOpen[key]=' ';
  if (key=='0'||key=='3'||key=='6'){
    row=0;
  }
  else if(key=='1'||key=='4'||key=='7'){
    row=1;
  }
  else if (key=='2'||key=='5'||key=='8'){
    row=2;
  }
  else{
    ErrorWasMade();
  }
  
  //vert Location
  if (key=='0'||key=='1'||key=='2'){
    col=0;
  }
  else if(key=='3'||key=='4'||key=='5'){
    col=1;
  }
  else  if (key=='6'||key=='7'||key=='8'){
    col=2;
  }
  else{
    ErrorWasMade();
  }
  
  shapes(row,col);
  
  println(key);
  println();
  }
  else{
    ErrorWasMade();
  }
}
void makeMove(){
  if (isPlayersTurn){
    
  }
}
void ErrorWasMade(){
  println("Invalid input, try again");
}
