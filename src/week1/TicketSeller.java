package week1;

public class TicketSeller {
  private TicketOffice ticketOffice;
  public void setTicketOffice(TicketOffice ticketOffice){
    this.ticketOffice = ticketOffice;
  }
  public Ticket getTicket(Audience audience){
    Ticket ticket = Ticket.EMPTY;
    if(audience.getInvitation() != Invitation.EMPTY){
      ticket = ticketOffice.getTicketWithNoFee();
      if(ticket != Ticket.EMPTY) audience.removeInvitation();
    }else{
      Long price = ticketOffice.getTicketPrice();
      if(price > 0 && audience.hasAmount(price)){
        ticket = ticketOffice.getTicketWithFee();
        if(ticket != Ticket.EMPTY) audience.minusAmount(price);
      }
    }
    return ticket;
  }
}