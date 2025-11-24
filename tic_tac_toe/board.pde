void grid(){
  strokeWeight(1);
  stroke(0,0,0);
  fill(0,0,0);
  text("0",10,20);
  text("1",176,20);
  text("2",176+166,20);
  
  text("3",10,20+166);
  text("4",176,20+166);
  text("5",176+166,20+166);
  
  text("6",10,20+166*2);
  text("7",176,20+166*2);
  text("8",176+166,20+166*2);
  
  line(width/3,0,width/3,height);
  line(width*2/3,0,width*2/3,height);
  line(0,height/3,width,height/3);
  line(0,height*2/3,width,height*2/3);
}
