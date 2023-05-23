int x = 0;
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
  fill(0);
  a.display(400,400);
}
