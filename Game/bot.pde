public class Bot extends User{
  public Bot(color x){
    super(x);
  }
  public int autoDiceRoll() {
    return(1+(int)Math.random()*6);
  }
}
