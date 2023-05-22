public class wheels{
  char[] alphabet;
  boolean original;
  char temp;
  wheels linked = null;
  public wheels(char[] alphabet, boolean original, wheels connection){
    this.alphabet = alphabet;
    this.original = original;
    linked = connection;
  }
  public wheels(char[] alphabet, boolean original){
    this.alphabet = alphabet;
    this.original = original;
  }
  public void link(wheels connection){
    linked = connection;
  }
  public take_zenith-1(){
    temp = alphabet[25];
    alphabet[25] = "";
  }
  public take_zenith+2(){
    temp = alphabet[3];
    alphabet[25] = "";
  }
  //[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]
  public shift_cipher(){
    //extract the letter tab found at position zenith-1 (i.e., one counter-clockwise position past the zenith) taking it out of the disk's alphabet, temporarily leaving an unfilled 'hole.'
    take_zenith-1();
    //Shift all letter tabs in positions zenith-2 (advancing counter-clockwise) down to and including the nadir (zenith-13), moving them in unison one position clockwise. This will close the current 'hole,' leaving a new 'hole' at the nadir position.
    for(int x = 24; x >12; x++){
      alphabet[x+1] = alphabet[x];
    }
    alphabet[x] = "";
    //Insert the previously extracted letter tab into the empty nadir position.
    alphabet[x] = temp;
  }
  public shift_original(){
    //Disengage the two disks, rotate the right disk one position counter-clockwise (i.e., the current letter at the zenith should rotate to position zenith-1), and reengage the two disks.
    char temp2 = alphabet[25];
    for(int x = 25; x>0; x++){
      alphabet[x] = alphabet[x-1];
    }
    alphabet[x] = temp2;
    temp = take_zenith+2();
    for(int x = 3; x<=13; x++){
      alphabet[x-1] = alphabet[x];
      if(x = 25){
        x = -1;
      }
    }
    alphabet[13] = temp;
  }
  
}
