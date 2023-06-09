public class wheels{
  float rot = 0.0;
  letter[] alphabet;
  boolean original;
  letter temp;
  color ani;
  boolean coloration = false;
  wheels linked = null;
  public wheels(char[] alphabet, boolean original, color ani, wheels connection){
    rot = 0.0;
    
    this.alphabet = new letter[alphabet.length];
    for(x = 0; x < alphabet.length; x++){
      this.alphabet[x] = new letter(alphabet[x], color(random(100,255), random(100,255), random(100,255)));
    }
    this.original = original;
    linked = connection;
    this.ani = ani;
  }
  public void display(int x, int y){
    fill(0);
    Boolean first = true;
    translate(x,y);
    circle(0,0,400);
    fill(255);
    for(float g = 0.0; g < 26; g++){
      if(first){
        first = false;
      }else{
        rotate((1.0/26) * TWO_PI);
      }
      fill(255);
      alphabet[int(g)].show(0, -182);
      //text(alphabet[int(g)], 0, -182);
      //text(alphabet[int(g)], (sin((g/26) * TWO_PI) * 200), (cos((g/26) * TWO_PI) * -200));
    }
    rotate((1.0/26) * TWO_PI);
    if(original){
      rotate((rot/26) * TWO_PI);
    }else{
      rotate(-1*((rot/26) * TWO_PI));
    }
    fill(255);
    square(-25,-25,50);
     if(original){
       rotate(-1*((rot/26) * TWO_PI));
     }else{
       rotate(((rot/26) * TWO_PI));
     }
    translate(-x,-y);
  }
  public wheels(char[] alphabet, boolean original, color ani){
    this.ani = ani;
    this.alphabet = new letter[alphabet.length];
    for(x = 0; x < alphabet.length; x++){
      this.alphabet[x] = new letter(alphabet[x], color(random(100,255), random(100,255), random(100,255)));
    }
    this.original = original;
  }
  public void link(wheels connection){
    linked = connection;
  }
  public void take_zenith1(){
    temp = alphabet[25];
    alphabet[25] = new letter(' ', alphabet[25].col);
  }
  public void take_zenith2(){
    temp = alphabet[2];
    alphabet[2] = new letter(' ', alphabet[2].col);
  }
  //[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]
  public void shift_cipher(){
    //extract the letter found at position zenith-1 (i.e., one counter-clockwise position past the zenith) taking it out of the disk's alphabet, temporarily leaving an unfilled 'hole.'
    take_zenith1();
    //Shift all letter tabs in positions zenith-2 (advancing counter-clockwise) down to and including the nadir (zenith-13), moving them in unison one position clockwise. This will close the current 'hole,' leaving a new 'hole' at the nadir position.
    for(int x = 24; x >12; x--){
      alphabet[x+1] = alphabet[x];
      print(alphabet[x]);
    }
    alphabet[13] = new letter(' ', alphabet[13].col);
    //Insert the previously extracted letter tab into the empty nadir position.
    alphabet[13] = temp;
  }
  public void shift_original(){
    rot-=1;
    //Disengage the two disks, rotate the right disk one position counter-clockwise (i.e., the current letter at the zenith should rotate to position zenith-1), and reengage the two disks.
    letter temp2 = alphabet[0];
    for(int x = 1; x<26; x++){
      alphabet[x-1] = alphabet[x];
      //println(alphabet[x]);
    }
    alphabet[25] = temp2;
    take_zenith2();
    for(int x = 3; x<=13; x++){
      alphabet[x-1] = alphabet[x];
      if(x == 25){
        x = -1;
      }
    }
    alphabet[13] = temp;
  }
  public void shift_alp_L(){
    temp = alphabet[0];
    for(x = 1; x < 26;x++){
      alphabet[x-1] = alphabet[x];
    }
    alphabet[25] = temp;
  }
  public void shift_alp_R(){
    temp = alphabet[25];
    for(x = 24; x >= 0;x--){
      alphabet[x+1] = alphabet[x];
      //print(alphabet[x+1]);
    }
    alphabet[0] = temp;
   }
}
