package week1;

public class Ticket {
  final static public Ticket EMPTY = new Ticket(null);
  final private Theater theater;
  private boolean isEntered = false;
  public Ticket(Theater theater){
    this.theater = theater;
  }
  public boolean isValid(Theater theater){
    if(isEntered || theater != this.theater || this == EMPTY){
      return false;
    }else{
      isEntered = true;
      return true;
    }
  }
  public Long getFee(){
    return theater.getFee();
  }
}
