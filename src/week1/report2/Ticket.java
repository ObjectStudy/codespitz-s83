package week1.report2;

public class Ticket {
  final static public Ticket EMPTY = new Ticket(null);
  final private Movie movie;
  private boolean isEntered = false;
  public Ticket(Movie movie){
    this.movie = movie;
  }
  public boolean isValid(Movie movie){
    if(isEntered || movie != this.movie || this == EMPTY){
      return false;
    }else{
      isEntered = true;
      return true;
    }
  }
  public Long getFee(){
    return movie.getFee();
  }
}
