package week2.report2;

import java.util.HashMap;
import java.util.Map;


public class Auditorium {
  
  private Long seat;
  private final Map<Screening, Long> screenings = new HashMap<>();
  public Auditorium(Long seat) {
    this.seat = seat;
  }
  public boolean addScreening(Screening screening) {
    if (screenings.containsKey(screening))
      return false;
    screenings.put(screening, this.seat);
    return true;
    
  }
  public void getScreening() {
    aa
  }
  
  /*boolean hasSeat(int count) {
    return seat >= count;
  }

  void reserveSeat(int count) {
    if (hasSeat(count))
      seat -= count;
    else
      throw new RuntimeException("no seat");
  }*/
}
