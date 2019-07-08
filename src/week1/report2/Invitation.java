package week1.report2;

public class Invitation {
  final static public Invitation EMPTY = new Invitation(null);
  final private Movie movie;
  public Invitation(Movie movie){
    this.movie = movie;
  }
}