int x = 0;
String text = "";
int mode = 0;
int steps = 0;
int next_steps = 0;
boolean finish_step = false;
int time = 0;
int length = 100;
boolean encode = true;
wheels a, b;

int button_x = 80;
int button_y = 450;
int button_w = 100;
int button_h = 70;

void setup(){
  size(1200, 600);
  background(138);
  color color1 = color(255, 0, 0);
  color color2 = color(0 ,255, 0);
  String Alp = "SGLBIZHJMFTRXAVKNQPDWYCUOE"; //plaintext alphabet
  String Alp2 = "XLEMFHIWOVNYRUDQCJPASGBTKZ"; //ciphertext
  Alp2 = "XZKTBGSAPJCQDURYNVOWIHFMEL"; //ciphertext reversed, keep first character
  char[] Alp_L = new char[26];
  char[] Alp2_L = new char[26];
  for(int x = 0; x < 26; x++){
    Alp_L[x] = Alp.charAt(x);
    Alp2_L[x] = Alp2.charAt(x);
  }
  a = new wheels(Alp_L, true, color1); //original
  b = new wheels(Alp2_L, false, color2, a); //cipher
  a.link(b);
}

void draw(){
  if(steps == -1){
    if(!(finish_step)){
      print("a");
      time = length;
      finish_step = true;
    }
    if(time == 0){
      steps = next_steps;
      finish_step = false;
    }else{ 
      time-=1;
      print(time);
    }
  }else if(steps == 7){
     a.rot -= 1.0;
     a.shift_alp_L();
    steps = -1;
    next_steps = 6;
  }else if(steps == 6){
    a.take_zenith2();
     steps = -1;
    next_steps = 5;
    }else if(steps == 5){
    for(int x = 3; x<=13; x++){
      a.alphabet[x-1] = a.alphabet[x];
      if(x == 25){
        x = -1;
      }
    }
    a.alphabet[13] = ' ';
    steps = -1;
    next_steps = 4;
    }else if(steps == 4){
      a.alphabet[13] = a.temp;
      steps = -1;
      next_steps = 3;
    }else if(steps == 3){
      b.take_zenith1();
      steps = -1;
      next_steps = 2;
    }else if(steps == 2){
      for(int x = 24; x >12; x--){
        b.alphabet[x+1] = b.alphabet[x];
      }
      b.alphabet[13] = ' ';
      steps = -1;
      next_steps = 1;
    }else if (steps == 1){
      b.alphabet[13] = b.temp;
      steps = -1;
      next_steps = 0;
    }
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
    if(steps == 0){
      if(keyCode == UP){
        a.rot -= 1.0;
        b.rot -= 1.0;
        a.shift_alp_L();
        b.shift_alp_R();
      }else if (keyCode == DOWN){
        a.rot += 1;
        b.rot += 1;
        a.shift_alp_R();
        b.shift_alp_L();
      }
    }
  }
  if(key == 'n'){
    if(encode){
      encode = false;
    }else{
      encode = true;
    }
  }
  if(key == 'r'){
    setup();
    text = "";
  }
  if(key == ' '){
    //text+=b.alphabet[0];
    //a.shift_original();
    //b.shift_cipher();
    if((mode == 0)&&(steps==0)){
      steps = -1;
      next_steps = 7;
      if(encode){
        text+=b.alphabet[0];
      }else{
        text+=a.alphabet[0];
      }
    }else if(mode == 1){
      if(encode){
        text+=b.alphabet[0];
      }else{
        text+=a.alphabet[0];
      }    
    a.shift_original();
    b.shift_cipher();
    }
      
  }
  if(key == 'm'){
    if((mode == 0)&&(steps == 0)){
      mode = 1;
    }else if(mode == 1){
      mode = 0;
    }
  }
}

void mousePressed(){
  if (mouseX >= button_x && mouseX <= button_x+button_w && 
      mouseY >= button_y && mouseY <= button_y+button_h) {
        text = "";
        setup();
      }
}
