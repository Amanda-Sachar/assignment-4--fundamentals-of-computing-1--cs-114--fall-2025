int row;
int col;
boolean isPlayersTurn=false;
char[] horSetOne={'-','-','-'};
char[] horSetTwo={'-','-','-'};
char[] horSetThree={'-','-','-'};

char[] verSetOne={'-','-','-'};
char[] verSetTwo={'-','-','-'};
char[] verSetThree={'-','-','-'};

char[] diagSetOne={'-','-','-'};
char[] diagSetTwo={'-','-','-'};
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
  
}

void draw() {
  grid();
}

void keyReleased(){
  //horizLocation
  if (key=='0'||key=='3'||key=='6'){
    row=0;
  }
  else if(key=='1'||key=='4'||key=='7'){
    row=1;
  }
  else{
    row=2;
  }
  
  //vert Location
  if (key=='0'||key=='1'||key=='2'){
    col=0;
  }
  else if(key=='3'||key=='4'||key=='5'){
    col=1;
  }
  else{
    col=2;
  }
  
    shapes(row,col);

  
  println(key);
  println();
}
