package week1.report2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TicketOffice {
  private Long amount;
  private List<Movie> movies = new ArrayList<>();
  
  public TicketOffice(Long amount){this.amount = amount;}
  
  public void setMovies(Movie ... movies) {
    this.movies.addAll(Arrays.asList(movies));
  }
  
  public Ticket getTicketWithFee(Movie movie){
    if(!movies.contains(movie)) return Ticket.EMPTY;
    else{
      Ticket ticket = movie.getTickets();
      amount += ticket.getFee();
      return ticket;
    }
  }
  public Ticket getTicketWithNoFee(Movie movie){
    if(!movies.contains(movie)) return Ticket.EMPTY;
    else{
      return movie.getTickets();
    }
  }
  public Long getTicketPrice(Movie movie){
    if(!movies.contains(movie)) return 0L;
    else return movie.getFee();
  }
}