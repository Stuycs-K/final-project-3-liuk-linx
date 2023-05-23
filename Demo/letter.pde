public class letter{
  char value;
  public letter(char val){
    value = val;
  }
  public void show(int x, int y, int angle){
    rotate(angle);
    text(value, x, y);
  }
}
