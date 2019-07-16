package week2.report2;

public class Reservation {
  static final Reservation NONE = new Reservation(null, null, null, null, 0);
  final Theater theater;
  final Movie movie;
  final Auditorium auditorium;
  final Screening screening;
  final int count;

  Reservation(Theater theater, Movie movie, Auditorium auditorium , Screening screening, int audienceCount) {
    this.theater = theater;
    this.movie = movie;
    this.auditorium = auditorium;
    this.screening = screening;
    this.count = audienceCount;
  }
}
