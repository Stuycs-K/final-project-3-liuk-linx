int x = 0;
float rot = 0.0;
String text = "";
wheels a, b;

int button_x = 80;
int button_y = 450;
int button_w = 100;
int button_h = 70;

void setup(){
  size(1200, 600);
  String Alp = "SGLBIZHJMFTRXAVKNQPDWYCUOE"; //plaintext alphabet
  String Alp2 = "XLEMFHIWOVNYRUDQCJPASGBTKZ"; //ciphertext
  Alp2 = "XZKTBGSAPJCQDURYNVOWIHFMEL"; //ciphertext reversed, keep first character
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
  textSize(16);
  background(138);
  fill(255,0,0);
  rect(378, 5, 50, 100);
  
  fill(0,255,0);
  rect(778, 5, 50, 100);
  
  fill(0);
  a.display(800,230);
  b.display(400,230);
  
  fill(181,30,13);
  rect(button_x, button_y, button_w, button_h, 18);
  fill(255);
  text("Reset", button_x + button_w / 2, button_y + button_h / 2);
  
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text(text,600,500);
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      rot -= 1.0;
      a.shift_alp_L();
      b.shift_alp_R();
    }else if (keyCode == DOWN){
      rot += 1;
      a.shift_alp_R();
      b.shift_alp_L();
    }
  }
  if(key == ' '){
    text+=b.alphabet[0];
    a.shift_original();
    b.shift_cipher();
  }
}

void mousePressed(){
  if (mouseX >= button_x && mouseX <= button_x+button_w && 
      mouseY >= button_y && mouseY <= button_y+button_h) {
        text = "";
        setup();
      }
}
