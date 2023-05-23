int x = 0;
void setup(){
  size(1200, 600);
}
void draw(){
  translate(600,300);
  x+=1;
  rotate(x);
  fill(255);
  //translate(600,300);
  circle(0,0,200);
  fill(0);
  text("hi",0,0);
}
