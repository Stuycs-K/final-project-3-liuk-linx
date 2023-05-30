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

int reset_button_x = 30;
int reset_button_y = 420;
int reset_button_w = 100;
int reset_button_h = 40;

int animation_button_x = 30;
int animation_button_y = 470;
int animation_button_w = 180;
int animation_button_h = 40;

int toggle_button_x = 30;
int toggle_button_y = 520;
int toggle_button_w = 220;
int toggle_button_h = 40;

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
  background(138);
  textSize(10);
  textAlign(LEFT);
  noFill();
  if(steps == -1){
    if(!(finish_step)){
      time = length;
      finish_step = true;
    }
    if(time == 0){
      steps = next_steps;
      finish_step = false;
    }else{ 
      time-=1;
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
  
  fill(255);
  textSize(20);
  if(mode == 0){
    text("Animation: on", 20, 30);
  }else{
    text("Animation: off", 20, 30);
  }
  if(encode){
    text("Encode", 20, 50);
  }else{
    text("Decode", 20, 50);
  }
  textSize(16);
  textAlign(CENTER);
  fill(255,0,0);
  rect(378, 5, 50, 100);
  
  fill(0,255,0);
  rect(778, 5, 50, 100);
  
  fill(0);
  a.display(800,230);
  b.display(400,230);
  
  fill(181,30,13);
  rect(reset_button_x, reset_button_y, reset_button_w, reset_button_h, 18);
  fill(255);
  text("Reset", reset_button_x + reset_button_w / 2, reset_button_y + reset_button_h / 2);
  
  fill(70, 161, 207);
  rect(animation_button_x, animation_button_y, animation_button_w, animation_button_h, 18);
  fill(0);
  text("Toggle Animation", animation_button_x + animation_button_w / 2, animation_button_y + animation_button_h / 2);

  fill(221,160,221);
  rect(toggle_button_x, toggle_button_y, toggle_button_w, toggle_button_h, 18);
  fill(0);
  text("Toggle Encrypt/Decrypt", toggle_button_x + toggle_button_w / 2, toggle_button_y + toggle_button_h / 2);
  
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
    encode = !encode;
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
  if (mouseX >= reset_button_x && mouseX <= reset_button_x+reset_button_w && 
      mouseY >= reset_button_y && mouseY <= reset_button_y+reset_button_h) {
        text = "";
        setup();
      }
  else if (mouseX >= animation_button_x && mouseX <= animation_button_x+animation_button_w && 
      mouseY >= animation_button_y && mouseY <= animation_button_y+animation_button_h) {
            if((mode == 0)&&(steps == 0)){
      mode = 1;
    }else if(mode == 1){
      mode = 0;
    }
      }
  else if (mouseX >= toggle_button_x && mouseX <= toggle_button_x+toggle_button_w && 
      mouseY >= toggle_button_y && mouseY <= toggle_button_y+toggle_button_h) {
      encode = !encode;
      }
}
