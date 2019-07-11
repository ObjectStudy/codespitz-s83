package week1.report2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Theater{
  
  
  final private List<TicketOffice> ticketOffices = new ArrayList<>();
  final private List<Movie> movies = new ArrayList<>();
  
  public void setTicketOffices(TicketOffice ... ticketOffices) {
    this.ticketOffices.addAll(Arrays.asList(ticketOffices));
  }
  public void setMovies(Movie ... movies) {
    this.movies.addAll(Arrays.asList(movies));
  }
  
  public void setTicket( TicketOffice ticketOffice, Movie movie ,  Long num){
    if(!ticketOffices.contains(ticketOffice)) return;
    if(!movies.contains(movie)) return;
    ticketOffice.addTicket(movie , num);
  }
  
  public void setInvitation(Audience audience , Movie movie){
    audience.setInvitation(new Invitation(movie));
  }
  public boolean enter(Audience audience , Movie movie){
    Ticket ticket = audience.getTicket();
    return ticket.isValid(movie);
  }
}