package week2.report2;

public class TicketSeller {
  private TicketOffice ticketOffice;

  public void setTicketOffice(TicketOffice ticketOffice) {
    this.ticketOffice = ticketOffice;
  }

  Reservation reserve(Customer customer, Theater theater, Movie movie, Auditorium auditorium, Screening screening,
      int count) {
    Reservation reservation = Reservation.NONE;
    Money price = movie.calculateFee(screening, count);
    if (customer.hasAmount(price)) {
      reservation = ticketOffice.reserve(theater, movie, auditorium, screening, count);
      if (reservation != Reservation.NONE)
        customer.minusAmount(price);
    }
    return reservation;
  }
}

