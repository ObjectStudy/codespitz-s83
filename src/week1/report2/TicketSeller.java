package week1.report2;

public class TicketSeller {
  private TicketOffice ticketOffice;
  public void setTicketOffice(TicketOffice ticketOffice){
    this.ticketOffice = ticketOffice;
  }
  public Ticket getTicket(Audience audience , Movie movie){
    Ticket ticket = Ticket.EMPTY;
    if(audience.getInvitation() != Invitation.EMPTY){
      ticket = ticketOffice.getTicketWithNoFee(movie);
      if(ticket != Ticket.EMPTY) audience.removeInvitation();
    }else{
      Long price = ticketOffice.getTicketPrice(movie);
      if(price > 0 && audience.hasAmount(price)){
        ticket = ticketOffice.getTicketWithFee(movie);
        if(ticket != Ticket.EMPTY) audience.minusAmount(price);
      }
    }
    return ticket;
  }
}