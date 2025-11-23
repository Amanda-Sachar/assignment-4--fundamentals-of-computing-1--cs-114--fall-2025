void shapes(int col, int row){
  if (isPlayersTurn){
    //O
    circle(166/2+166*row,166/2+166*col,CIRCRADIUS);
  }
  else{
    //X
    line(166*row,166*col,166*(row+1),166*(col+1));
    line(166*(row+1),166*col,166*row,166*(col+1));
  }
  println("the row is "+row);
  println("the col is "+col);
}
//class O{
//  int row, col;
//  O(int centerX, int centerY){
//    row=centerX;
//    col=centerY;
//  }
//}

//class X{
//  int row, col;
//  X(int X, int Y){
//    row=X;
//    col=Y;
//  }
//}
