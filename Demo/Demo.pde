int x = 0;
float rot = 0.0;
String text = "";
wheels a, b;
void setup(){
  size(1200, 600);
  String Alp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String Alp2 = "QWERTYUIOPASDFGHJKLZXCVBNM";
  char[] Alp_L = new char[26];
  char[] Alp2_L = new char[26];
  for(int x = 0; x < 26; x++){
    Alp_L[x] = Alp.charAt(x);
    Alp2_L[x] = Alp2.charAt(x);
  }
  a = new wheels(Alp_L, true);
  b = new wheels(Alp2_L, false, a);
  a.link(b);
  a.display(400,400);
}
void draw(){
  background(255);
  fill(255,0,0);
  rect(378, 5, 50, 100);
  fill(0,255,0);
    rect(778, 5, 50, 100);
  fill(0);
  a.display(400,230);
  b.display(800,230);
  fill(0);
  textAlign(CENTER);
  text(text,600,500);
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      rot += 1.0;
    }else if (keyCode == DOWN){
      rot -= 1;
    }
  }
  if(key == ' '){
    text+=b.alphabet[0];
    a.shift_original();
    b.shift_cipher();
  }
}
