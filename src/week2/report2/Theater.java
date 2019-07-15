package week2.report2;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Theater {
  public static final Set<Screening> EMPTY = new HashSet<>();
  private final Set<TicketOffice> ticketOffices = new HashSet<>();
  private final Set<Auditorium> auditoriums = new HashSet<>();
  //private final Map<Movie, Set<Screening>> movies = new HashMap<>();
  private final Map<Movie, Set<Auditorium>> movies = new HashMap<>();
  
  private Money amount;

  public Theater(Money amount) {
    this.amount = amount;
  }

  public boolean addMovie(Movie movie) {
    if (movies.containsKey(movie))
      return false;
    movies.put(movie, new HashSet<>());
    return true;
  }

  public boolean addScreening(Movie movie, Auditorium auditorium, Screening screening) {
    if (!movies.containsKey(movie))
      return false;
    if (!auditoriums.contains(auditorium))
      return false;
    
    auditorium.addScreening(screening);
    return movies.get(movie).add(auditorium);
  }

  public boolean contractTicketOffice(TicketOffice ticketOffice, Double rate) {
    if (!ticketOffice.contract(this, rate))
      return false;
    return ticketOffices.add(ticketOffice);
  }

  public boolean cancelTicketOffice(TicketOffice ticketOffice) {
    if (!ticketOffices.contains(ticketOffice) || !ticketOffice.cancel(this))
      return false;
    return ticketOffices.remove(ticketOffice);
  }

  void plusAmount(Money amount) {
    this.amount = this.amount.plus(amount);
  }

  public Set<Screening> getScreening(Movie movie , Auditorium auditorium) {
    if (!movies.containsKey(movie) || movies.get(movie).size() == 0 || !movies.get(movie).contains(auditorium))
      return EMPTY;
    
    return auditorium.getScreening();
  }

  boolean isValidScreening(Movie movie, Screening screening) {
    return movies.containsKey(movie) && movies.get(movie).contains(screening);
  }

  public boolean enter(Customer customer, int count) {
    Reservation reservation = customer.reservation;
    return reservation != Reservation.NONE && reservation.theater == this
        && isValidScreening(reservation.movie, reservation.screening) && reservation.count == count;
  }

  Reservation reserve(Movie movie, Screening screening, int count) {
    if (!isValidScreening(movie, screening) || !screening.hasSeat(count))
      return Reservation.NONE;
    screening.reserveSeat(count);
    return new Reservation(this, movie, screening, count);
  }

  public boolean addAuditorium(Auditorium auditorium) {
    if (auditoriums.contains(auditorium))
      return false;
    return auditoriums.add(auditorium);
  }
  
}
