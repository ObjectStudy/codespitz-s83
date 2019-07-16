package week2.report1;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Main {
  public static void main(String[] args) {
    Theater theater = new Theater(Money.of(100.0));
    Movie<AmountDiscount> movie = new Movie<AmountDiscount>("spiderman", Duration.ofMinutes(120L), Money.of(5000.0),
        new SequenceAmountDiscount(Money.of(1000.0), 1));
    theater.addMovie(movie);
    for (int day = 7; day < 32; day++) {
      for (int hour = 10, seq = 1; hour < 24; hour += 3, seq++) {
        theater.addScreening(movie,
            new Screening(seq, LocalDateTime.of(2019, 7, day, hour, 00, 00), 100));
      }
    }
    
    //5명이상 50% 할인
    Movie<PercentDiscount> groupMovie = new Movie<PercentDiscount>("aladin", Duration.ofMinutes(120L), Money.of(5000.0),
        new GroupPercentDiscount(0.5, 4)
        );
    theater.addMovie(groupMovie);
    for (int day = 7; day < 32; day++) {
      for (int hour = 10, seq = 1; hour < 24; hour += 3, seq++) {
        theater.addScreening(groupMovie,
            new Screening(seq, LocalDateTime.of(2019, 7, day, hour, 00, 00), 100));
      }
    }
    
    //Period 할인
    DayOfWeek dayOfWeek = DayOfWeek.valueOf(DayOfWeek.MONDAY.name());
    LocalTime startTime =LocalTime.of(10, 0, 0);
    LocalTime endTime =LocalTime.of(23, 0, 0);

    Movie<AmountDiscount> periodMovie = new Movie<AmountDiscount>("aladin", Duration.ofMinutes(120L), Money.of(5000.0),
        new PeriodAmountDiscount(Money.of(1000.0), dayOfWeek , startTime ,endTime));
    theater.addMovie(periodMovie);
    for (int day = 7; day < 32; day++) {
      for (int hour = 10, seq = 1; hour < 24; hour += 3, seq++) {
        theater.addScreening(periodMovie,
            new Screening(seq, LocalDateTime.of(2019, 7, day, hour, 00, 00), 100));
      }
    }
    
    
    TicketOffice ticketOffice = new TicketOffice(Money.of(0.0));
    theater.contractTicketOffice(ticketOffice, 10.0);
    TicketSeller seller = new TicketSeller();
    seller.setTicketOffice(ticketOffice);
    Customer customer1 = new Customer(Money.of(20000.0));
    
    Customer customer2_ok = new Customer(Money.of(20000.0));
    Customer customer2_false = new Customer(Money.of(14000.0));
    
    Customer customer3_ok = new Customer(Money.of(8000.0));
    Customer customer3_false = new Customer(Money.of(8000.0));
    
    for (Screening screening : theater.getScreening(movie)) {
      customer1.reverse(seller, theater, movie, screening, 2);
      boolean isOk = theater.enter(customer1, 2);
      System.out.println(isOk);
      break;
    }
    //단체
    for (Screening screening : theater.getScreening(groupMovie)) {
      //단체할인
      customer2_ok.reverse(seller, theater, groupMovie, screening, 8); //5000 * 8  * 0.5 = 20000
      boolean isOk = theater.enter(customer2_ok, 8); // true
      System.out.println("customer2_ok : "+ isOk);
      //단체미할인
      customer2_false.reverse(seller, theater, groupMovie, screening, 3); //5000 * 3  = 15000
      isOk = theater.enter(customer2_false, 3); // false
      System.out.println("customer2_false : "+ isOk);
      break;
    }
    //시간
    for (Screening screening : theater.getScreening(periodMovie)) {
      if(screening.whenScreened.getDayOfWeek().equals(dayOfWeek)) {//할인시간 조건 만존
        customer3_ok.reverse(seller, theater, periodMovie, screening, 2); // 5000 *2 - 2000 = 8000
        boolean isOk = theater.enter(customer3_ok, 2);
        System.out.println("customer3_ok : "+ isOk);
        break;
      }
    }
    
    for (Screening screening : theater.getScreening(periodMovie)) {
        customer3_false.reverse(seller, theater, periodMovie, screening, 2); // 5000 *2 = 10000
        boolean isOk = theater.enter(customer3_false, 2);
        System.out.println("customer3_false : "+ isOk);
        break;
      }
  }
}
