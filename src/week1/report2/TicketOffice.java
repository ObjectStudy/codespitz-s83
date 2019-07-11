package week1.report2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TicketOffice {
  private Long amount;
  private Map<Movie,List<Ticket>> movies = new HashMap<>();
  
  public TicketOffice(Long amount){this.amount = amount;}
  
  public Ticket getTicketWithFee(Movie movie){
    if(!movies.containsKey(movie)) return Ticket.EMPTY;
    else if(movies.get(movie).size() == 0) return Ticket.EMPTY;
    else{
      Ticket ticket = movies.get(movie).remove(0);
      amount += ticket.getFee();
      return ticket;
    }
  }
  public Ticket getTicketWithNoFee(Movie movie){
    if(!movies.containsKey(movie)) return Ticket.EMPTY;
    else if(movies.get(movie).size() == 0) return Ticket.EMPTY;
    else{
      return movies.get(movie).remove(0);
    }
  }
  public Long getTicketPrice(Movie movie){
    if(!movies.containsKey(movie)) return 0L;
    else if(movies.get(movie).size() == 0) return 0L;
    else return movies.get(movie).get(0).getFee();
  }
  
  public void addTicket(Movie movie , long num){
    List<Ticket> tickets = new ArrayList<>();
    while(num-- > 0) {
      tickets.add(new Ticket(movie));
    }
    movies.put(movie, tickets);
  }
}