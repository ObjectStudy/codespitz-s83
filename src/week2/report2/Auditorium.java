package week2.report2;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;


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
  public Set<Screening> getScreening() {
    return this.screenings.keySet();
  }
  
  boolean hasSeat(Screening screening , int count) {
    return screenings.get(screening) >= count;
  }

  void reserveSeat(Screening screening , int count) {
    if (hasSeat(screening , count))
      screenings.put(screening , screenings.get(screening) - count);
    else
      throw new RuntimeException("no seat");
  }
  
  public Long getSeat(Screening screening) {
	  return screenings.get(screening);
  }
}
