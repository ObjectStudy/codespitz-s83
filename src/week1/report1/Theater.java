package week1.report1;


public class Theater{
  private TicketOffice ticketOffice = TicketOffice.EMPTY ;
  final private Long fee;
  public Theater( Long fee){
    this.fee = fee;
  }
  Long getFee(){
    return this.fee;
  }
  
  public void setTicketOffices(TicketOffice ticketOffice ) {
    this.ticketOffice = ticketOffice;
  }
  public void setTicket(Long num){
    if(this.ticketOffice == TicketOffice.EMPTY) return;
    while(num-- > 0) {
      this.ticketOffice.addTicket(new Ticket(this));
    }
  }
  public void setInvitation(Audience audience){
    audience.setInvitation(new Invitation(this));
  }
  public boolean enter(Audience audience){
    Ticket ticket = audience.getTicket();
    return ticket.isValid(this);
  }
}