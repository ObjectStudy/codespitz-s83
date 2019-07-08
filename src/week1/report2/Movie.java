package week1.report2;

import java.util.ArrayList;
import java.util.List;

public class Movie {
  final static public Movie EMPTY = new Movie(null);
  private List<Ticket> tickets = new ArrayList<>();
  final private Long fee;
  public Movie(Long fee){
    this.fee = fee;
  }
  
  public Long getFee(){
    return this.fee;
  }
  
  public void addTicket(){
    this.tickets.add(new Ticket(this));
  }
  
  public void setInvitation(Audience audience){
    audience.setInvitation(new Invitation(this));
  }
  public boolean enter(Audience audience){
    Ticket ticket = audience.getTicket();
    return ticket.isValid(this);
  }
  
  public Ticket getTickets() {
    if(tickets.size() == 0) return Ticket.EMPTY;
    else {
      return tickets.remove(0);
    }
  }
}
