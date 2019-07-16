package week2.report2;

import java.time.Duration;
import java.time.LocalDateTime;

public class Main {
  public static void main(String[] args) {
    Theater theater = new Theater(Money.of(100.0));
    Auditorium auditorium = new Auditorium(100L);
    Movie<AmountDiscount> movie = new Movie<AmountDiscount>("spiderman", Duration.ofMinutes(120L), Money.of(5000.0),
        new SequenceAmountDiscount(Money.of(1000.0), 1));
    theater.addMovie(movie);
    theater.addAuditorium(auditorium);
        
    for (int day = 7; day < 32; day++) {
      for (int hour = 10, seq = 1; hour < 24; hour += 3, seq++) {
        theater.addScreening(movie, auditorium ,
            new Screening(seq, LocalDateTime.of(2019, 7, day, hour, 00, 00) ));
      }
    }

    TicketOffice ticketOffice = new TicketOffice(Money.of(0.0));
    theater.contractTicketOffice(ticketOffice, 10.0);
    TicketSeller seller = new TicketSeller();
    seller.setTicketOffice(ticketOffice);
    Customer customer = new Customer(Money.of(20000.0));
    for (Screening screening : theater.getScreening(movie , auditorium)) {
      customer.reverse(seller, theater, movie, auditorium , screening, 2);
      boolean isOk = theater.enter(customer, 2);
      System.out.println(isOk);//true
      System.out.println(auditorium.getSeat(screening));//98
      break;
    }
    
  }
}
