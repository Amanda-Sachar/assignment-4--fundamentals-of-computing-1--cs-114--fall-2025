void shapes(int row, int col){
  //row and col refer to the game board
  if (isPlayersTurn){
    //O
    noFill();
    strokeWeight(4);
    stroke(255,0,0);
    circle(166/2+166*row,166/2+166*col,CIRCRADIUS);
    boardState[col][row]='O';
  }
  else{
    //X
    strokeWeight(4);
    stroke(0,0,255);
    line(166*row,166*col,166*(row+1),166*(col+1));
    line(166*(row+1),166*col,166*row,166*(col+1));
    boardState[col][row]='X';
  }
}
