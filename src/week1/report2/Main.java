package week1.report2;

public class Main {
  public static void main(String[] args) {
    Theater theater = new Theater();
    TicketOffice ticketOffice = new TicketOffice(0L);
    Audience audience1 = new Audience(0L);
    Audience audience2 = new Audience(50L);
    TicketSeller seller = new TicketSeller();
    Movie movie1 = new Movie(100L);
    Movie movie2 = new Movie(20L);
    
    theater.setTicketOffices(ticketOffice);
    theater.setMovies(movie1 , movie2);
    
    theater.setTicket(ticketOffice, movie1, 10L);
    theater.setTicket(ticketOffice, movie2, 50L);
    
    
    theater.setInvitation(audience1 , movie1);
    seller.setTicketOffice(ticketOffice);
    
    audience1.buyTicket(seller , movie1);
    audience2.buyTicket(seller , movie2);
    
    boolean isOk1 = theater.enter(audience1 ,movie1);
    boolean isOk2 = theater.enter(audience1 ,movie2);
    boolean isOk3 = theater.enter(audience2 ,movie1);
    boolean isOk4 = theater.enter(audience2 ,movie2);
    
    System.out.println(isOk1);//true
    System.out.println(isOk2);//false
    System.out.println(isOk3);//false
    System.out.println(isOk4);//true
  }
}