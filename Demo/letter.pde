public class letter{
  char value;
  color col;
  public letter(char val, color col){
    value = val;
    this.col = col;
  }
public void show(int x, int y){
   fill(col);
   text(value, x, y);
  }
}
